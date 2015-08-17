note
	description: "Summary description for {STRING_PARAMETER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:44 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	STRING_PARAMETER

inherit
	PARAMETER
		redefine
			make, building_action_table, display_item
		end

create
	make

feature {NONE} -- Initialization

	make
			--
		do
			Precursor
			create item.make_empty
		end

feature -- Access

	item: STRING

feature {NONE} -- Implementation

	display_item
			--
		do
			log.put_string_field ("value", item)
			log.put_new_line
		end

feature {NONE} -- Build from XML

	set_item_from_node
			--
		do
			item := node.to_string
		end

	building_action_table: like Type_building_actions
			-- Nodes relative to element: value
		do
			create Result.make (<<
				["text()", agent set_item_from_node]
			>>)
		end

end
