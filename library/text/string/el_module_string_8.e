note
	description: "Summary description for {EL_MODULE_STRING_8}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-17 11:19:06 GMT (Wednesday 17th December 2014)"
	revision: "3"

class
	EL_MODULE_STRING_8

inherit
	EL_MODULE

feature -- Access

	String_8: EL_STRING_X_ROUTINES [STRING_8]
			--
		once
			create Result
		end
end
