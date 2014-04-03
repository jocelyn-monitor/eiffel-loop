note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-10-18 11:03:17 GMT (Friday 18th October 2013)"
	revision: "3"

deferred class
	EVOLICITY_DIRECTIVE

feature -- Basic operations

	execute (context: EVOLICITY_CONTEXT; output: IO_MEDIUM; utf8_encoded: BOOLEAN)
			--
		deferred
		end

feature {NONE} -- Implementation

	put_string (output: IO_MEDIUM; a_string: EL_ASTRING; utf8_encoded: BOOLEAN)
		require
			latin_characters_excludes_unicode: not utf8_encoded implies not a_string.has_foreign_characters
		do
			if utf8_encoded then
				output.put_string (a_string.to_utf8)

			elseif attached {STRING} a_string as str8 then
				-- Allows the possibility of encoding output with any latin character set
				output.put_string (str8)

			else
				output.put_string (a_string.to_utf8)
			end
		end

end -- class EVOLICITY_DIRECTIVE

