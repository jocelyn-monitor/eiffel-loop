note
	description: "Summary description for {EL_ERROR_DIALOG}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-04-02 9:56:56 GMT (Wednesday 2nd April 2014)"
	revision: "4"

deferred class
	EL_ERROR_DIALOG

inherit
	EV_DIALOG

feature {NONE} -- Initialization

	make (a_title, a_message: EL_ASTRING)
		deferred
		end

end
