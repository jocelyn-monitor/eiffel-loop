﻿note
	description: "Summary description for {EL_GPG_ENCRYPT_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	EL_GPG_ENCRYPT_IMPL

inherit
	EL_COMMAND_IMPL

feature -- Access

	Program_path: EL_FILE_PATH
		once
			Result := Environment.Execution.command_path_abs ("gpg")
		end

feature -- Basic operations

	set_arguments (command: EL_GPG_ENCRYPT_COMMAND; arguments: EL_COMMAND_ARGUMENT_LIST)

 			-- gpg --batch --encrypt --recipient $GPG_KEY_ID "$TAR_NAME"

 		do
 			arguments.set_command_option_prefix ("--")
 			arguments.add_options_list ("batch encrypt")
 			arguments.add_option_argument ("recipient", command.recipient)
			arguments.add_path (command.output_path)
		end

end
