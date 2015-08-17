﻿note
	description: "Summary description for {EL_DATE_ROUTINES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:30 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	EL_LOCALE_DATE_TEXT

inherit
	EL_ENGLISH_DATE_TEXT
		redefine
			week_day_name, month_name, ordinal_indicator, Default_ordinal_indicator
		end

	EL_MODULE_LOCALE

feature {NONE} -- Implementation

	week_day_name (day: INTEGER; short: BOOLEAN): ASTRING
			--	
		do
			Result := Locale * Precursor (day, short)
		end

	month_name (month_of_year: INTEGER; short: BOOLEAN): ASTRING
			--
		do
			if not short and then month_of_year = 5 then
				Result := Locale * "{May}"
			else
				Result := Locale * Precursor (month_of_year, short)
			end
		end

feature {NONE} -- Implementation

	ordinal_indicator (i: INTEGER): ASTRING
			--	
		do
			Result := Locale * Ordinal_indicator_template #$ [i]
		end

feature {NONE} -- Constants

	Default_ordinal_indicator: ASTRING
			--	
		once
			Result := ordinal_indicator (0)
		end

	Ordinal_indicator_template: ASTRING
		once
			Result := "{ordinal-indicator.$S}"
		end

end
