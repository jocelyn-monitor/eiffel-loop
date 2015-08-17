note
	description: "Delete file or directory"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-02-08 13:44:24 GMT (Sunday 8th February 2015)"
	revision: "3"

class
	EL_DELETE_PATH_COMMAND

inherit
	EL_SINGLE_OPERAND_FILE_SYSTEM_COMMAND [EL_DELETE_PATH_IMPL]
		rename
			path as target_path,
			set_path as set_target_path
		redefine
			getter_function_table
		end

create
	make, default_create

feature {NONE} -- Evolicity reflection

	getter_function_table: like getter_functions
			--
		do
			create Result.make (<<
				["target_path", agent: EL_PATH do Result := target_path end]
			>>)
		end

end
