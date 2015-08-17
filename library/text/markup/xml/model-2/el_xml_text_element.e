﻿note
	description: "[
		For example:
			<p>Some text</p>
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-07 14:07:28 GMT (Sunday 7th June 2015)"
	revision: "2"

class
	EL_XML_TEXT_ELEMENT

inherit
	EL_XML_CONTENT_ELEMENT
		redefine
			make, copy, is_equal
		end

create
	make

convert
	make ({STRING})

feature {NONE} -- Initialization

	make (a_name: READABLE_STRING_GENERAL)
		do
			Precursor (a_name)
			text := Empty_string
		end

feature -- Access

	text: ASTRING

feature -- Basic operations

	write (medium: EL_OUTPUT_MEDIUM)
		do
			medium.put_astring (open)
			medium.put_astring (text)
			medium.put_astring (closed)
			medium.put_new_line
		end

feature -- Element change

	set_text (a_text: like text)
		do
			text := a_text
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := Precursor (other) and then text ~ other.text
		end

feature {NONE} -- Duplication

	copy (other: like Current)
		do
			Precursor (other)
			text := other.text.twin
		end

end
