note
	description: "Summary description for {EL_ASTRING_VIEW}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:28 GMT (Wednesday 11th March 2015)"
	revision: "4"

class
	EL_ASTRING_VIEW

inherit
	EL_STRING_VIEW
		redefine
			text, to_string, to_string_8, to_string_32, same_i_th_code
		end

create
	default_create, make

feature -- Access

	to_string: ASTRING
		do
			Result := to_string_general
		end

	to_string_8, to_latin1: STRING
			--
		do
			Result := to_string_general.to_latin1
		end

	to_string_32, to_unicode: STRING_32
			--
		do
			Result := to_string_general.to_unicode
		end

feature {EL_STRING_VIEW} -- Implementation

	same_i_th_code (a_text: ASTRING; i: INTEGER): BOOLEAN
			-- Compare augmented latin codes
		do
			Result := text.code (zero_based_offset + i) = a_text.code (i)
		end

	text: ASTRING

end
