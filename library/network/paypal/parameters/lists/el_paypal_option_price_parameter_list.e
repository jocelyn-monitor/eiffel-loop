note
	description: "Summary description for {EL_PAYPAL_OPTION_PRICE_VARIABLE_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-17 11:04:16 GMT (Sunday 17th May 2015)"
	revision: "5"

class
	EL_PAYPAL_OPTION_PRICE_PARAMETER_LIST

inherit
	EL_PAYPAL_PARAMETER_LIST

create
	make

feature {NONE} -- Constants

	Name_prefix: EL_ASTRING
		once
			Result := "L_OPTION?PRICE"
		end

end
