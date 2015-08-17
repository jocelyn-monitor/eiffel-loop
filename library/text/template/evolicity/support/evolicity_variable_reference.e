note
	description: "Summary description for {EVOLICITY_REFERENCE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:27 GMT (Wednesday 11th March 2015)"
	revision: "4"

class
	EVOLICITY_VARIABLE_REFERENCE

inherit
	ARRAYED_LIST [ASTRING]
		rename
			item as step,
			islast as is_last_step,
			last as last_step
		redefine
			default_create, out
		end

	EL_MODULE_STRING
		undefine
			default_create, is_equal, copy, out
		end

create
	default_create, make, make_from_array

feature {NONE} -- Initialization

	default_create
		do
			make (0)
		end

feature -- Access

	out: STRING
		do
			Result := String.joined (Current, "/").to_utf8
		end

	arguments: ARRAY [ANY]
			-- Arguments for eiffel context function with open arguments
		do
			Result := Empty_arguments
		end

feature -- Status query

	before_last: BOOLEAN
		do
			Result := index = count - 1
		end

feature {NONE} -- Constants

	Empty_arguments: ARRAY [ANY]
		once
			create Result.make_empty
		end
end
