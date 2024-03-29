note
	description: "[
					Docking manager holder which hold an instance of {SD_DOCKING_MANAGER}
	]"

	legal: "See notice at end of class."

	status: "See notice at end of class."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2013 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2009-08-06 8:38:56 GMT (Thursday 6th August 2009)"
	revision: "2"

deferred class
	DOCKING_MANAGER_HODLER

feature -- Access

	docking_manager: SD_DOCKING_MANAGER
			-- Docking manager

	window: MAIN_WINDOW
			-- Related window of Current

;note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"


end
