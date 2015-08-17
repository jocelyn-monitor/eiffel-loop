note
	description: "Summary description for {EL_WINDOWS_CODEC}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "4"

deferred class
	EL_WINDOWS_CODEC

inherit
	EL_CODEC
		export
			{EL_FACTORY_CLIENT} make
		end

feature -- Access

	Type: STRING = "WINDOWS"

end
