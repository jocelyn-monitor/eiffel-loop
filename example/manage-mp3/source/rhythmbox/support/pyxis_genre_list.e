note
	description: "Summary description for {GENRE_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-10-25 9:46:22 GMT (Friday 25th October 2013)"
	revision: "5"

class
	PYXIS_GENRE_LIST

inherit
	LINKED_LIST [EL_ASTRING]
		rename
			make as make_list
		end

	EL_PYXIS_STRING_LIST
		undefine
			is_equal, copy
		redefine
			make
		end

create
	make, make_from_file, make_from_string

feature {NONE} -- Initialization

	make
		do
			make_list
			compare_objects
			Precursor
		end

feature {NONE} -- Constants

	Root_node_name: STRING = "genres"

end
