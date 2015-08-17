note
	description: "Summary description for {EL_STRING_CONSTANTS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:57:11 GMT (Wednesday 11th March 2015)"
	revision: "4"

class
	EL_STRING_CONSTANTS

feature {NONE} -- Constants

	Empty_string: ASTRING
		once
			create Result.make_empty
		end

	Empty_string_8: STRING = ""

	Empty_string_32: STRING_32 = ""

invariant
	always_empty: Empty_string.is_empty and Empty_string_8.is_empty and Empty_string_8.is_empty
end
