﻿note
	description: "Summary description for {EL_PYTHON_STRING_ESCAPER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-17 19:38:50 GMT (Wednesday 17th December 2014)"
	revision: "4"

class
	EL_PYTHON_STRING_ESCAPER

inherit
	EL_CHARACTER_ESCAPER

create
	make

feature {NONE} -- Initialization

	make (quote_count: INTEGER)
		require
			single_or_double_quotes: quote_count = 1 or quote_count = 2
		do
			characters := "%T%N\"
			if quote_count = 1 then
				characters.append_character ('%'')
			else
				characters.append_character ('"')
			end
		end

feature {NONE} -- Implementation

	append_escape_sequence (str: STRING_32; c: CHARACTER_32)
		do
			str.append_character ('\')
			str.append_character (c)
		end

	characters: STRING_32

feature {NONE} -- Constants

	Character_intervals: SPECIAL [TUPLE [from_code, to_code: CHARACTER_32]]
		once
			create Result.make_empty (0)
		end

end
