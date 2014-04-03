note
	description: "Summary description for {THUNDERBIRD_ACCOUNT}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-19 18:58:54 GMT (Tuesday 19th November 2013)"
	revision: "4"

class
	THUNDERBIRD_MAIL_EXPORTER

inherit
	EL_COMMAND

	EL_MODULE_LOG
	EL_MODULE_DIRECTORY
	EL_MODULE_FILE_SYSTEM

create
	default_create, make

feature {EL_SUB_APPLICATION} -- Initialization

	make (a_account_name, a_export_type: EL_ASTRING; a_export_path, thunderbird_home_dir: EL_DIR_PATH)
		require
			valid_type: Export_types.has (a_export_type)
		local
			profile_lines: EL_UTF_8_FILE_LINES
			mail_dir_path_steps: EL_PATH_STEPS
		do
			log.enter_with_args ("make", << a_account_name, a_export_path >>)
			account_name := a_account_name; export_type := a_export_type; export_path := a_export_path
			mail_dir_path_steps := thunderbird_home_dir.steps
			mail_dir_path_steps.extend (".thunderbird")
			create profile_lines.make (mail_dir_path_steps.as_directory_path + "profiles.ini")
			across profile_lines as line loop
				if line.item.starts_with ("Path=") then
					mail_dir_path_steps.extend (line.item.split ('=').last)
				end
			end
			mail_dir_path_steps.extend ("Mail")
			mail_dir_path_steps.extend (account_name)
			mail_dir_path := mail_dir_path_steps
			log.put_line (mail_dir_path.to_string)
			log.exit
		end

feature -- Basic operations

	execute
		local
			find_files: EL_FIND_FILES_COMMAND
		do
			log.enter ("execute")
			across mail_subdirs as subdir_path loop
				create find_files.make (subdir_path.item, "*.msf")
				find_files.execute
				across find_files.path_list as file_path loop
					export_mails (file_path.item.without_extension)
				end
			end
			log.exit
		end

feature {NONE} -- Implementation

	mail_subdirs: ARRAYED_LIST [EL_DIR_PATH]
		local
			find_command: EL_FIND_DIRECTORIES_COMMAND
		do
			create find_command.make (mail_dir_path)
			find_command.disable_recursion
			find_command.execute
			create Result.make (find_command.path_list.count)
			across find_command.path_list as dir loop
				if dir.item.to_string.ends_with (".sbd") then
					Result.extend (dir.item)
				end
			end
		end

	export_mails (mails_path: EL_FILE_PATH)
		local
			converter: like create_converter
		do
			log.enter_with_args ("export_mails", << mails_path >>)
			converter := create_converter (mails_path)
			log_or_io.put_path_field ("Exporting", mails_path)
			log_or_io.put_new_line
			converter.convert_mails (mails_path)
			log.exit
		end

	create_converter (mails_path: EL_FILE_PATH): THUNDERBIRD_MAIL_CONVERTER
		local
			relative_path_steps: EL_PATH_STEPS
			output_dir: EL_DIR_PATH
		do
			relative_path_steps := mails_path.steps
			relative_path_steps.start
			from until relative_path_steps.first ~ account_name or relative_path_steps.is_empty loop
				relative_path_steps.remove
			end
			if not relative_path_steps.is_empty then
				relative_path_steps.remove
			end
			across relative_path_steps as step loop
				if step.item.ends_with (Dot_sbd_extension) then
					step.item.remove_tail (Dot_sbd_extension.count)
				end
			end
			if export_type ~ Type_htmlbody then
				-- Put the language code at beginning, for example: help/en -> en/help
				relative_path_steps.put_front (relative_path_steps.last)
				relative_path_steps.finish
				relative_path_steps.remove
			end
			output_dir := export_path.joined_dir_steps (relative_path_steps)
			File_system.make_directory (output_dir)
			if export_type ~ Type_xhtml then
				create {THUNDERBIRD_MAIL_TO_XHTML_CONVERTER} Result.make (output_dir)
			else
				create {THUNDERBIRD_MAIL_TO_HTML_BODY_CONVERTER} Result.make (output_dir)
			end
		end

	account_name: STRING

	export_path: EL_DIR_PATH

	export_type: STRING

	mail_dir_path: EL_DIR_PATH

feature -- Constants

	Dot_sbd_extension: STRING = ".sbd"

	Type_xhtml: EL_ASTRING
		once
			Result := "xhtml"
		end

	Type_htmlbody: EL_ASTRING
		once
			Result := "htmlbody"
		end

	Export_types: ARRAY [EL_ASTRING]
		once
			Result := << Type_xhtml, Type_htmlbody >>
			Result.compare_objects
		end

end
