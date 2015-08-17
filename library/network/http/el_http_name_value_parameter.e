note
	description: "Summary description for {EL_PAYPAL_API_ARGUMENT}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-28 8:26:14 GMT (Thursday 28th May 2015)"
	revision: "5"

class
	EL_HTTP_NAME_VALUE_PARAMETER

inherit
	EL_HTTP_PARAMETER
		rename
			extend as extend_table
		end

create
	make

feature {NONE} -- Initialization

	make (a_name: like name; a_value: like value)
		do
			name := a_name; value := a_value
		end

feature -- Access

	name: ASTRING

	value: ASTRING

feature {EL_HTTP_PARAMETER} -- Implementation

	extend_table (table: EL_HTTP_HASH_TABLE)
		do
			table.set_string (name, value)
		end
end
