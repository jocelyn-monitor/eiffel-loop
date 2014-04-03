note
	description: "Summary description for {EL_SCROLLABLE_AREA}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-12-09 15:39:32 GMT (Monday 9th December 2013)"
	revision: "3"

class
	EL_SCROLLABLE_AREA

inherit
	EV_SCROLLABLE_AREA
		redefine
			create_implementation, implementation
		end

create
	default_create

feature {NONE} -- Implementation

	implementation: EL_SCROLLABLE_AREA_I

	create_implementation
			--
		do
			create {EL_SCROLLABLE_AREA_IMP} implementation.make
		end
end
