note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-20 16:39:50 GMT (Wednesday 20th November 2013)"
	revision: "4"

class
	EVOLICITY_FREE_TEXT_DIRECTIVE

inherit
	EVOLICITY_DIRECTIVE

create
	make

feature {NONE} -- Initialization

	make (a_text: like text)
		do
			text := a_text
		end

feature -- Access

	text: EL_ASTRING

feature -- Basic operations

	execute (context: EVOLICITY_CONTEXT; output: IO_MEDIUM; utf8_encoded: BOOLEAN)
			--
		do
			if utf8_encoded then
				output.put_string (text.to_utf8)
			else
				output.put_string (text)
			end
		end

end -- class EVOLICITY_FREE_TEXT_DIRECTIVE
