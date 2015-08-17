﻿note
	description: "XML element with list of nested elements"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-07 14:08:06 GMT (Sunday 7th June 2015)"
	revision: "2"

class
	EL_XML_LIST_ELEMENT

inherit
	EL_XML_CONTENT_ELEMENT
		redefine
			make, copy
		end

create
	make

convert
	make ({STRING})

feature {NONE} -- Initialization

	make (a_name: READABLE_STRING_GENERAL)
		do
			Precursor (a_name)
			create {ARRAY [EL_XML_ELEMENT]} list.make_empty
		end

feature -- Access

	list: INDEXABLE [EL_XML_ELEMENT, INTEGER]

feature -- Basic operations

	write (medium: EL_OUTPUT_MEDIUM)
		do
			medium.put_astring (open)
			if not list.is_empty then
				medium.put_new_line
				across list.index_set as index loop
					list.item (index.item).write (medium)
				end
			end
			medium.put_astring (closed)
			medium.put_new_line
		end

feature -- Element change

	set_list (a_list: like list)
		do
			list := a_list
		end

feature {NONE} -- Duplication

	copy (other: like Current)
		do
			Precursor (other)
			list := other.list.twin
		end

end
