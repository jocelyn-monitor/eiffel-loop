﻿note
	description: "Summary description for {EL_DIR_PATH}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-27 19:46:55 GMT (Saturday 27th June 2015)"
	revision: "6"

class
	EL_DIR_PATH

inherit
	EL_PATH

	EL_SHARED_DIRECTORY
		rename
			directory as shared_directory
		undefine
			default_create, out, is_equal, copy
		end

create
	default_create, make, make_from_unicode, make_from_latin1, make_from_path, make_from_other

convert
	make ({ASTRING}),
	make_from_latin1 ({STRING}),
	make_from_unicode ({STRING_32}),
	make_from_path ({PATH}),

 	to_string: {ASTRING}, unicode: {READABLE_STRING_GENERAL}, steps: {EL_PATH_STEPS}, to_path: {PATH}

feature -- Conversion

	joined_dir_steps (a_steps: EL_PATH_STEPS): like Current
		do
			Result := joined_dir_path (a_steps)
		end

	joined_file_steps (a_steps: EL_PATH_STEPS): like joined_file_path
		do
			Result := joined_file_path (a_steps)
		end

	joined_file_path alias "+" (a_file_path: EL_FILE_PATH): like Type_file_path
		do
			create Result.make_from_other (Current); Result.append (a_file_path)
		end

	joined_dir_path (a_dir_path: EL_DIR_PATH): like Current
		do
			create Result.make_from_other (Current)
			Result.append_dir_path (a_dir_path)
		end

feature -- Status report

	is_parent_of (other: EL_PATH): BOOLEAN
		local
			l_path: ASTRING
		do
			l_path := to_string
			if other.parent_path.starts_with (l_path)
				and then l_path.count = other.parent_path.count or else other.parent_path [l_path.count + 1] = Separator
			then
				Result := True
			end
		end

	exists: BOOLEAN
		do
			Result := named_directory (Current).exists
		end

	is_writable: BOOLEAN
		do
			Result := named_directory (Current).is_writable
		end

	exists_and_is_writeable: BOOLEAN
		local
			dir: like Shared_directory
		do
			dir := named_directory (Current)
			Result := dir.exists and then dir.is_writable
		end

	is_createable: BOOLEAN
		do
			Result := parent.exists_and_is_writeable
		end

feature {NONE} -- Implementation

	new_relative_path: EL_DIR_PATH
		do
			create Result.make_from_other (Current)
		end

feature {NONE} -- Type definitions

	Type_file_path: EL_FILE_PATH
		require
			never_called: False
		once
		end

feature -- Constants

	Is_directory: BOOLEAN = True

end
