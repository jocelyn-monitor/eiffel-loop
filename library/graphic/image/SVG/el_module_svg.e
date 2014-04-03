note
	description: ""

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-30 11:43:05 GMT (Thursday 30th January 2014)"
	revision: "3"

class
	EL_MODULE_SVG

inherit
	EL_MODULE

feature -- Access

	SVG: EL_MODULE_SVG_ROUTINES
		once
			create Result.make
		end

end
