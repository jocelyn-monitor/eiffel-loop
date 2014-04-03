note
	description: ""

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-03-17 8:13:41 GMT (Monday 17th March 2014)"
	revision: "2"

class
	EL_STRING_DELETE_EDITION

inherit
	EL_STRING_EDITION
		rename
			make as make_edition
		end

create
	make

feature {NONE} -- Initialization

	make (a_caret_position: INTEGER; substring_interval: INTEGER_INTERVAL)
		do
			make_edition (a_caret_position.to_natural_16, substring_interval.lower.to_natural_16)
			end_index := substring_interval.upper.to_natural_16
		end

feature -- Basic operations

	apply (target: EL_ASTRING)
		do
			target.remove_substring (start_index, end_index)
		end

feature {NONE} -- Implementation

	end_index: NATURAL_16

end
