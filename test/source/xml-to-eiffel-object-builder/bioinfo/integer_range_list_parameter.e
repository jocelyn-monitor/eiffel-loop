﻿note
	description: "Summary description for {INTEGER_RANGE_LIST_PARAMETER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-01-01 15:56:21 GMT (Thursday 1st January 2015)"
	revision: "3"

class
	INTEGER_RANGE_LIST_PARAMETER

inherit
	LIST_PARAMETER [ARRAYED_LIST [INTEGER]]
		redefine
			building_action_table, display_item
		end

create
	make

feature -- Basic operations

	display_item
			--
		do
			log.put_string ("Integer range [")
			log.put_integer (index)
			log.put_string ("]: ")
			from item.start until item.after loop
				log.put_integer (item.item)
				log.put_string (" ")
				item.forth
			end
			log.put_new_line
		end

feature {NONE} -- Implementation

	last_integer_range: like item

feature {NONE} -- Build from XML

	add_integer_range
			--
		local
			integer_list: EL_ASTRING_LIST
		do
			create integer_list.make_with_separator (node.to_string, ',', False)
			create last_integer_range.make (integer_list.count)
			across integer_list as str loop
				last_integer_range.extend (str.item.to_integer)
			end
			extend (last_integer_range)
		end

	building_action_table: like Type_building_actions
			-- Nodes relative to element: value
		do
			create Result.make (<<
				["text()", agent add_integer_range]
			>>)
		end

end
