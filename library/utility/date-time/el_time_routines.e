note
	description: "Summary description for {EL_TIME_ROUTINES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-19 17:30:20 GMT (Tuesday 19th November 2013)"
	revision: "2"

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

	unix_date_time (a_date_time: DATE_TIME): INTEGER
		do
			Result := a_date_time.relative_duration (Unix_origin).seconds_count.to_integer
		end

	unix_origin: DATE_TIME
		-- Time 00:00 on 1st Jan 1970

end
