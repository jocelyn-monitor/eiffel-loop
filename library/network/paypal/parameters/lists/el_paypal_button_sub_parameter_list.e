﻿note
	description: "Summary description for {EL_PAYPAL_BUTTON_VARIABLE_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-17 10:31:51 GMT (Sunday 17th May 2015)"
	revision: "5"

class
	EL_PAYPAL_BUTTON_SUB_PARAMETER_LIST

inherit
	EL_PAYPAL_SUB_PARAMETER_LIST

create
	make

feature -- Element change

	currency_code: STRING
		do
			find_first (Var_currency_code, agent {EL_HTTP_NAME_VALUE_PARAMETER}.name)
			if exhausted then
				create Result.make_empty
			else
				Result := item.value.to_string_8
			end
		end

	set_currency_code (code: STRING)
		do
			extend (Var_currency_code, code)
		end

	set_item_name (name: ASTRING)
		do
			extend (Var_item_name, name)
		end

	set_item_product_code (code: ASTRING)
		do
			extend (Var_item_number, code)
		end

feature {NONE} -- Constants

	Name_prefix: ASTRING
		once
			Result := "L_BUTTONVAR"
		end

	Var_currency_code: ASTRING
		once
			Result := "currency_code"
		end

	Var_item_name: ASTRING
		once
			Result := "item_name"
		end

	Var_item_number: ASTRING
		once
			Result := "item_number"
		end

end
