note
	description: "Unix compatible UCS-4 wchar_t"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:26 GMT (Wednesday 11th March 2015)"
	revision: "6"

class
	EL_C_WIDE_CHARACTER_STRING

inherit
	EL_C_STRING_32

create
	default_create, make_owned, make_shared, make_owned_of_size, make_shared_of_size, make, make_from_string

convert
	as_string: {ASTRING}, as_string_8: {STRING}, as_string_32: {STRING_32}

end
