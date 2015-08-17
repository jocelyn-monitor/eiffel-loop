note
	description: "Summary description for {EL_DO_NOTHING_CHARACTER_ESCAPER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-17 15:20:03 GMT (Wednesday 17th December 2014)"
	revision: "4"

class
	EL_DO_NOTHING_CHARACTER_ESCAPER

inherit
	EL_CHARACTER_ESCAPER

feature {NONE} -- Implementation

	append_escape_sequence (str: STRING_32; c: CHARACTER_32)
		do
		end

feature {NONE} -- Constants

	Character_intervals: SPECIAL [TUPLE [from_code, to_code: CHARACTER_32]]
		once
			create Result.make_empty (0)
		end

	Characters: STRING_32
		once
			create Result.make_empty
		end
end
