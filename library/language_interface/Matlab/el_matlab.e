note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2012 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2012-12-16 11:34:28 GMT (Sunday 16th December 2012)"
	revision: "1"

class
	EL_MATLAB

feature {NONE} -- Implementation

	engine: EL_MATLAB_ENGINE
			-- COM interface engine
		once
			create Result.make
		end
	
	initialize_app: EL_MATLAB_APPLICATION
			-- Standalone application initialization
		once
			create Result.make
		end
	
		
end
