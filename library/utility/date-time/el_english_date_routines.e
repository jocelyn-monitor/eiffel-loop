note
	description: "Summary description for {EL_ENGLISH_DATE_ROUTINES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-05 12:54:50 GMT (Sunday 5th January 2014)"
	revision: "3"

class
	EL_ENGLISH_DATE_ROUTINES

inherit
	EL_DATE_ROUTINES

feature {NONE} -- Implementation

	Default_ordinal_indicator: EL_ASTRING
			--	
		once
			Result := "th"
		end

	ordinal_indicator (i: INTEGER): EL_ASTRING
		do
			inspect i
				when 1 then
					Result := "st"
				when 2 then
					Result := "nd"
				when 3 then
					Result := "rd"
			else
				Result := Default_ordinal_indicator
			end
		end

	short_month (month: INTEGER): EL_ASTRING
			--	
		once
			Result := months_text [month]
			Result.to_proper_case
		end

	day_full_text (day_of_week: INTEGER): EL_ASTRING
			--
		do
			Result := long_days_text [day_of_week]
			Result.to_proper_case
		end

	month_full_text (month: INTEGER): EL_ASTRING
			--
		do
			Result := long_months_text [month]
			Result.to_proper_case
		end

end
