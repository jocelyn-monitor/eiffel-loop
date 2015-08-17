note
	description: "Summary description for {EL_OS_COMMAND_OUTPUT_PARSER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 14:04:41 GMT (Wednesday 11th March 2015)"
	revision: "2"

deferred class
	EL_OS_COMMAND_OUTPUT_PARSER

inherit
	EL_PLAIN_TEXT_LINE_STATE_MACHINE

feature {EL_OS_COMMAND} -- Access

	initial_state: like state
		do
			Result := agent find_line
		end

feature -- Status change

	reset
		deferred
		end

feature {NONE} -- Line states

	find_line (line: ASTRING)
		do
		end

end
