note
	description: "Summary description for {EVOLICITY_FUNCTION_REFERENCE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:26 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	EVOLICITY_FUNCTION_REFERENCE

inherit
	EVOLICITY_VARIABLE_REFERENCE
		rename
			make as make_reference
		redefine
			arguments
		end

create
	make

feature {NONE} -- Initialization

	make (a_variable_ref_steps: ARRAY [ASTRING]; a_arguments: like arguments)
		do
			make_from_array (a_variable_ref_steps)
			arguments := a_arguments
		end

feature -- Access

	arguments: ARRAY [ANY]
		-- Arguments for eiffel context function with open arguments

end
