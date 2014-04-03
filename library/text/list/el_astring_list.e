note
	description: "Summary description for {EL_ASTRING_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-05 13:07:22 GMT (Sunday 5th January 2014)"
	revision: "3"

class
	EL_ASTRING_LIST

inherit
	EL_STRING_LIST [EL_ASTRING]

create
	make, make_empty, make_with_separator, make_with_lines, make_with_words, make_from_array

convert
	make_from_array ({ARRAY [EL_ASTRING]})
	
end
