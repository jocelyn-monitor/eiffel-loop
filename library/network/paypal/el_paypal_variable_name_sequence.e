note
	description: "Summary description for {EL_PAYPAL_SEQUENTIAL_VARIABLE_NAME}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-31 15:45:26 GMT (Tuesday 31st March 2015)"
	revision: "5"

deferred class
	EL_PAYPAL_VARIABLE_NAME_SEQUENCE

feature {NONE} -- Implementation

	new_name: ASTRING
		do
			Result := name_prefix + count.out
		end

	name_prefix: ASTRING
		deferred
		end

feature -- Measurement

	count: INTEGER
		deferred
		end
end
