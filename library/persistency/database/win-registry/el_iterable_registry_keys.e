note
	description: "Summary description for {EL_ITERABLE_REGISTRY_KEYS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-03-01 16:03:26 GMT (Saturday 1st March 2014)"
	revision: "2"

class
	EL_ITERABLE_REGISTRY_KEYS

inherit
	ITERABLE [WEL_REGISTRY_KEY]

create
	make

feature {NONE} -- Initialization

	make (a_reg_path: like reg_path)
		do
			reg_path := a_reg_path
		end

feature -- Access: cursor

	new_cursor: EL_REGISTRY_KEY_ITERATION_CURSOR
		do
			create Result.make (reg_path)
		end

feature {NONE} -- Implementation

	reg_path: EL_DIR_PATH

end
