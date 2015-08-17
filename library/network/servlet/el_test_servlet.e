note
	description: "Summary description for {EL_TEST_SERVLET}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-04-29 14:59:34 GMT (Wednesday 29th April 2015)"
	revision: "6"

class
	EL_TEST_SERVLET

inherit
	EL_HTTP_SERVLET
		redefine
			on_serve_done
		end

create
	make

feature {NONE} -- Basic operations

	serve (request: like Type_request; response: like Type_response)
		do
			log.enter ("serve")
			log.put_labeled_string ("IP", request.remote_address)
			log.put_new_line
			response.send_latin_1_plain ("Your IP address is: " + request.remote_address)
			log.exit
		end

	on_serve_done (request: like Type_request)
		do
			log.enter ("on_serve_done")
			log.put_labeled_string ("request.content", request.content)
			log.put_new_line
			log.exit
		end

end
