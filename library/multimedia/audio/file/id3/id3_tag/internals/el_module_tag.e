note
	description: "Summary description for {EL_SHARED_ID3_TAGS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-01 13:48:00 GMT (Friday 1st November 2013)"
	revision: "3"

class
	EL_MODULE_TAG

feature {NONE} -- Constants

	Tag: EL_ID3_TAGS
		once
			create Result
		end

end
