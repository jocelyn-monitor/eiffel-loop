note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2012 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2012-12-16 11:34:31 GMT (Sunday 16th December 2012)"
	revision: "1"

class
	EL_APPLICATION_EVENT_PROCESSOR

inherit
	EL_EVENT_PROCESSOR

	EV_SHARED_APPLICATION
	
create
	default_create

feature {NONE} -- Implementation

	process_events
			-- 
		do
			ev_application.process_events
		end

end
