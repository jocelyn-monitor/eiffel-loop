note
	description: "Summary description for {EL_HASH_SET}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-28 9:25:24 GMT (Thursday 28th May 2015)"
	revision: "4"

class
	EL_HASH_SET [G -> HASHABLE]

inherit
	HASH_TABLE [detachable G, detachable G]
		rename
			put as table_put,
			item_for_iteration as item,
			item as table_item,
			current_keys as to_array
		export
			{NONE} table_put, force, extend
		end

	LINEAR [detachable G]
		rename
			has as has_item
		undefine
			copy, is_equal, off, search, linear_representation, occurrences, has_item
		end

create
	make, make_equal

feature -- Element change

	put (new: detachable G)
			--
		do
			table_put (new, new)
		end

feature -- Access

	index: INTEGER

feature {NONE} -- Unused

	finish
			--
		do
		end

end
