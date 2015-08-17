﻿note
	description: "[
		Servlet that returns OK as a response. Useful for closing down a background servlet by
		first calling {EL_FAST_CGI_SERVLET_SERVICE}.set_end_application and then invoking this servlet using CURL.
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-04-15 11:48:12 GMT (Wednesday 15th April 2015)"
	revision: "6"

class
	EL_OK_SERVLET

inherit
	EL_HTTP_SERVLET

create
	make

feature {NONE} -- Basic operations

	serve (request: like Type_request; response: like Type_response)
		do
			response.send_ok
		end
end
