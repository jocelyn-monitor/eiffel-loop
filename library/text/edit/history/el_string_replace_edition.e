note
	description: ""

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-03-17 8:14:00 GMT (Monday 17th March 2014)"
	revision: "2"

class
	EL_STRING_REPLACE_EDITION

inherit
	EL_STRING_INSERT_EDITION
		rename
			insertion as replacement
		redefine
			apply
		end

create
	make

feature -- Basic operations

	apply (target: EL_ASTRING)
		do
			target.replace_substring (replacement, start_index, end_index)
		end

end
