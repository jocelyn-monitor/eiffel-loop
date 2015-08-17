﻿note
	description: "Summary description for {EL_TIME_ROUTINES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-01-09 14:11:29 GMT (Friday 9th January 2015)"
	revision: "3"

class
	EL_TIME_ROUTINES

create
	make

feature {NONE} -- Initialization

	make
		do
			create unix_origin.make_fine (1970, 1, 1, 0, 0, 0.0)
		end

feature -- Access

	is_valid (time_str: STRING): BOOLEAN
		local
			parts: LIST [STRING]
		do
			if time_str.count >= 4 then
				parts := time_str.split (':')
				if parts.count = 2 and then across parts as part all part.item.is_integer end then
					Result := True
				end
			end
		end

	unix_date_time (a_date_time: DATE_TIME): INTEGER
		do
			Result := a_date_time.relative_duration (Unix_origin).seconds_count.to_integer
		end

	unix_origin: DATE_TIME
		-- Time 00:00 on 1st Jan 1970

end
