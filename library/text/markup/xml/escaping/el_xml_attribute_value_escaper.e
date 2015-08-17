note
	description: "Summary description for {EL_XML_ATTRIBUTE_VALUE_BASIC_CHARACTER_ESCAPER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-19 10:14:07 GMT (Friday 19th December 2014)"
	revision: "6"

class
	EL_XML_ATTRIBUTE_VALUE_ESCAPER

inherit
	EL_XML_CHARACTER_ESCAPER
		redefine
			make
		end

create
	make, make_128_plus

feature {NONE} -- Initialization

	make
		do
			Precursor
			predefined_entities [{CHARACTER_32}'"'] := named_entity ("quot")
		end

end
