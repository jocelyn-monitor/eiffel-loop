note
	description: "Summary description for {EL_VERTICAL_BOX}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-03-14 14:45:40 GMT (Friday 14th March 2014)"
	revision: "3"

class
	EL_VERTICAL_BOX

inherit
	EL_BOX
		rename
			implementation as box_implementation
		undefine
			fill, item, is_in_default_state, is_equal, prune_all, extend, put, replace
		end

	EV_VERTICAL_BOX
		select
			implementation
		end

create
	default_create, make

feature {NONE} -- Implementation

	set_last_size (size: INTEGER)
			--
		do
			last.set_minimum_height (size)
		end

	cms_to_pixels (cms: REAL): INTEGER
			-- centimeters to pixels conversion according to box orientation
		do
			Result := Screen.vertical_pixels (cms)
		end

end
