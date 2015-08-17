note
	description: "Summary description for {EL_LATIN_FILE_PATH}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:26 GMT (Wednesday 11th March 2015)"
	revision: "6"

class
	EL_FILE_PATH

inherit
	EL_PATH

create
	default_create, make, make_from_unicode, make_from_latin1, make_from_path, make_from_other

convert
	make ({ASTRING}),
	make_from_unicode ({STRING_32}),
	make_from_latin1 ({STRING}),
	make_from_path ({PATH}),

 	to_string: {ASTRING}, unicode: {READABLE_STRING_GENERAL}, steps: {EL_PATH_STEPS}, to_path: {PATH}

feature -- Access

	modification_time: DATE_TIME
		do
			if exists then
				create Result.make_from_epoch (File_system.closed_raw_file (Current).date)
			else
				create Result.make (0, 0, 0, 0, 0, 0)
			end
		end

feature -- Status report

	exists: BOOLEAN
		do
			Result := File_system.closed_raw_file (Current).exists
		end

	Is_directory: BOOLEAN = False

feature {NONE} -- Implementation

	new_relative_path: EL_FILE_PATH
		do
			create Result.make_from_other (Current)
		end

end
