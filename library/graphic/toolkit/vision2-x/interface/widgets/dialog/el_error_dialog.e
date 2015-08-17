﻿note
	description: "Summary description for {EL_ERROR_DIALOG}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:28 GMT (Wednesday 11th March 2015)"
	revision: "6"

deferred class
	EL_ERROR_DIALOG

inherit
	EV_DIALOG
		rename
			set_position as set_absolute_position,
			set_x_position as set_absolute_x_position,
			set_y_position as set_absolute_y_position
		end

	EL_WINDOW
		undefine
			default_create, copy
		end

feature {NONE} -- Initialization

	make (a_title, a_message: ASTRING)
		deferred
		end

end
