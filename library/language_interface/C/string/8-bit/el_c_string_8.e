note
	description: "Summary description for {EL_C_STRING_8}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-02-24 18:14:37 GMT (Monday 24th February 2014)"
	revision: "3"

class
	EL_C_STRING_8

inherit
	EL_C_STRING
		rename
			Natural_8_bytes as width
		end

create
	default_create, make_owned, make_shared, make_owned_of_size, make_shared_of_size, make, make_from_string

convert
	as_string_8: {STRING}

feature -- Access

	item (index: INTEGER): NATURAL_32
			--
		do
			Result := read_natural_8 ((index - 1) * width)
		end

	is_item_zero (address: POINTER): BOOLEAN
			--
		do
			share_from_pointer (address, width)
			Result := read_natural_8 (0) = 0
		end

feature -- Element change	

	put_item (value: NATURAL_32; index: INTEGER)
			--
		do
			put_natural_8 (value.to_natural_8, (index - 1) * width)
		end

end
