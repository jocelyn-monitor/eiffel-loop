note
	description: "Summary description for {DO_NOTHING_SERIALIZATION_LISTENER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-27 10:17:32 GMT (Saturday 27th June 2015)"
	revision: "4"

class
	EL_DO_NOTHING_FILE_LISTENER

inherit
	EL_FILE_PROGRESS_LISTENER

create
	make

feature {NONE} -- Implementation

	set_text (a_text: ASTRING)
		do
		end

	set_progress (proportion: DOUBLE)
		do
		end

	on_time_estimation (a_seconds: INTEGER)
		do
		end

	on_finish
		do
		end

end
