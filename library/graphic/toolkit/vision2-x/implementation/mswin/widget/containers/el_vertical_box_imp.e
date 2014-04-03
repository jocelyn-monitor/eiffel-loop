note
	description: "Summary description for {EL_VERTICAL_BOX_IMP}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-03-13 10:41:02 GMT (Thursday 13th March 2014)"
	revision: "3"

class
	EL_VERTICAL_BOX_IMP

inherit
	EV_VERTICAL_BOX_IMP

create
	make

feature -- Basic operations

	force_resize (a_width: INTEGER)
		do
			ev_apply_new_size (0, 0, a_width, height, True)
		end
end
