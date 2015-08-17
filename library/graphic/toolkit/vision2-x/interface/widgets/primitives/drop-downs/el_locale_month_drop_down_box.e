﻿note
	description: "Summary description for {INTERNATIONAL_MONTH_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:33:27 GMT (Thursday 11th December 2014)"
	revision: "4"

class
	EL_LOCALE_MONTH_DROP_DOWN_BOX

inherit
	EL_ENGLISH_MONTH_DROP_DOWN_BOX
		redefine
			Short_months, Long_months
		end

	EL_MODULE_LOCALE
		undefine
			default_create, is_equal, copy
		end

create
	make, make_long

feature {NONE} -- Constants

	Short_months: EL_ASTRING_LIST
			-- Short text representation of months
		once
			Result := Locale.date_text.short_month_names_list
		end

	Long_months: EL_ASTRING_LIST
			-- Long text representation of months
		once
			Result := Locale.date_text.long_month_names_list
		end

end
