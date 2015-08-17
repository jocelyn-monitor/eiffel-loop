note
	description: "Summary description for {EL_XML_TEXT_NODE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-06 10:49:32 GMT (Saturday 6th June 2015)"
	revision: "2"

class
	EL_XML_TEXT_NODE

inherit
	EL_XML_ELEMENT

create
	make

convert
 make ({ASTRING})

feature {NONE} -- Initialization

	make (a_text: like text)
		do
			text := a_text
		end

feature -- Access

	name: ASTRING
		do
			Result := "text()"
		end

	text: ASTRING

feature -- Basic operations

	write (medium: EL_OUTPUT_MEDIUM)
		do
			medium.put_string (text)
		end

end
