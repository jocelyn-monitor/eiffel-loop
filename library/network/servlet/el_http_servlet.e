note
	description: "Summary description for {EL_HTTP_SERVLET}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-20 12:51:28 GMT (Wednesday 20th November 2013)"
	revision: "4"

class
	EL_HTTP_SERVLET

inherit
	GOA_HTTP_SERVLET
		redefine
			servlet_config
		end

feature {NONE} -- Initialization

	make (a_servlet_config: like servlet_config)
		do
			servlet_config := a_servlet_config
			servlet_info := ""
		end

feature {NONE} -- Implementation

	servlet_config: EL_SERVLET_CONFIG

end
