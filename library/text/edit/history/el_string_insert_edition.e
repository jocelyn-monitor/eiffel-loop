note
	description: ""

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-03-17 8:13:50 GMT (Monday 17th March 2014)"
	revision: "2"

class
	EL_STRING_INSERT_EDITION

inherit
	EL_STRING_DELETE_EDITION
		rename
			make as make_delete_edition
		redefine
			apply
		end

create
	make

feature {NONE} -- Initialization

	make (a_caret_position: INTEGER; substring_interval: INTEGER_INTERVAL; a_insertion: like insertion)
		do
			make_delete_edition (a_caret_position, substring_interval)
			insertion := a_insertion
		end

feature -- Basic operations

	apply (target: EL_ASTRING)
		do
			target.insert_string (insertion, start_index)
		ensure then
			inserted_into_target: not insertion.is_empty implies target.substring (start_index, end_index) ~ insertion
		end

feature {NONE} -- Implementation

	insertion: STRING

end
