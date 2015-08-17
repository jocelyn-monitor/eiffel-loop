note
	description: "Summary description for {EL_EIFFEL_TEXT_EDITOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:47:28 GMT (Wednesday 11th March 2015)"
	revision: "6"

deferred class
	EL_EIFFEL_TEXT_EDITOR

inherit
	EL_TEXT_EDITOR
		redefine
			put_string
		end

feature {NONE} -- Implementation

	put_string (str: READABLE_STRING_GENERAL)
			-- Write `s' at current position.
		do
			if is_utf8_encoded then
				output.put_string (String.as_utf8 (str))
			else
				if attached {ASTRING} str as el_str then
					output.put_string (el_str.to_latin1)
				else
					output.put_string (str.to_string_8)
				end
			end
		end
end
