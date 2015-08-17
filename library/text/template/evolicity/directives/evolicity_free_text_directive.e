﻿note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:26 GMT (Wednesday 11th March 2015)"
	revision: "5"

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

	text: ASTRING

feature -- Basic operations

	execute (context: EVOLICITY_CONTEXT; output: EL_OUTPUT_MEDIUM)
			--
		do
			output.put_string (text)
		end

end -- class EVOLICITY_FREE_TEXT_DIRECTIVE
