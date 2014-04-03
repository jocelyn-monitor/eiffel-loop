note
	description: "Summary description for {EL_LOCALE_DROP_DOWN_LIST_BOX}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-11 11:21:07 GMT (Saturday 11th January 2014)"
	revision: "5"

class
	EL_LOCALE_STRING_DROP_DOWN_BOX

inherit
	EL_ASTRING_DROP_DOWN_BOX
		rename
			displayed_text as translation
		redefine
			translation
		end

	EL_MODULE_LOCALE
		undefine
			default_create, copy, is_equal
		end

create
	make, make_unadjusted, make_alphabetical, make_alphabetical_unadjusted

feature {NONE} -- Implementation

	translation (a_string: EL_ASTRING): EL_ASTRING
		do
			Result := Locale * a_string
		end

end
