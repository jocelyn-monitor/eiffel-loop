note
	description: "Summary description for {EL_MODULE_STRING_32}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-17 11:16:04 GMT (Wednesday 17th December 2014)"
	revision: "3"

class
	EL_MODULE_STRING_32

inherit
	EL_MODULE

feature -- Access

	String_32: EL_STRING_X_ROUTINES [STRING_32]
			--
		once
			create Result
		end
end
