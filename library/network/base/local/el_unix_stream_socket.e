note
	description: "Summary description for {EL_UNIX_STREAM_SOCKET}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	EL_UNIX_STREAM_SOCKET

inherit
	UNIX_STREAM_SOCKET
		rename
			put_string as put_string_8
		undefine
			read_stream, readstream
		end

	EL_STREAM_SOCKET

create
	make_client, make_server

end
