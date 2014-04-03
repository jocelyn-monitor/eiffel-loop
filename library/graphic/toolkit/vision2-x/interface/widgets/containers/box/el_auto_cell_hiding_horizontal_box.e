note
	description: "Summary description for {EL_AUTO_CELL_HIDING_HORIZONTAL_BOX}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2013 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-06-08 8:31:13 GMT (Saturday 8th June 2013)"
	revision: "2"

class
	EL_AUTO_CELL_HIDING_HORIZONTAL_BOX

inherit
	EL_AUTO_CELL_HIDING_BOX
		rename
			implementation as hiding_box_implementation
		undefine
			fill, item, is_in_default_state, is_equal, prune_all, extend, put, replace,
			internal_remove, internal_merge_right
		end

	EL_HORIZONTAL_BOX
		rename
			remove as internal_remove, merge_right as internal_merge_right, Screen as Mod_screen
		undefine
			make
		select
			implementation
		end

create
	default_create, make

end
