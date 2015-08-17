note
	description: "Summary description for {EL_PAYPAL_OPTION_SELECT_VARIABLE_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-31 17:01:13 GMT (Tuesday 31st March 2015)"
	revision: "5"

class
	EL_PAYPAL_OPTION_SELECT_SUB_PARAMETER_LIST

inherit
	EL_PAYPAL_PARAMETER_LIST

create
	make

feature {NONE} -- Constants

	Name_prefix: EL_ASTRING
		once
			Result := "L_OPTION?SELECT"
		end
end
