﻿note
	description: "Summary description for {EL_SINGLE_OPERAND_FILE_SYSTEM_COMMAND}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-24 10:35:29 GMT (Wednesday 24th June 2015)"
	revision: "5"

deferred class
	EL_SINGLE_OPERAND_FILE_SYSTEM_COMMAND [T -> EL_COMMAND_IMPL create make end]

inherit
	EL_FILE_SYSTEM_OS_COMMAND [T]
		redefine
			make_default, default_create
		end

feature {NONE} -- Initialization

	make_default
		do
			create {EL_DIR_PATH} path
			Precursor
		end

	default_create
		do
			make_command
		end

	make (a_path: like path)
			--
		do
			make_command
			path := a_path
		end

feature -- Access

	path: EL_PATH

feature -- Element change

	set_path (a_path: like path)
			--
		require
			valid_extension: is_valid_extension (a_path.extension)
		do
			path := a_path
		end

feature -- Contract Support

	is_valid_extension (extension: STRING): BOOLEAN
		do
			Result := not Valid_extension.is_empty implies extension ~ Valid_extension
		end

feature {NONE} -- Evolicity reflection

	getter_function_table: like getter_functions
			--
		do
			create Result.make (<<
				["path", agent: EL_PATH do Result := path end]
			>>)
		end

feature -- Constants

	Valid_extension: ASTRING
		once
			create Result.make_empty
		end

end
