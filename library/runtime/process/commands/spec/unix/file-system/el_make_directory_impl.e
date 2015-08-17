note
	description: "Summary description for {EL_MAKE_DIRECTORY_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-24 10:36:04 GMT (Wednesday 24th June 2015)"
	revision: "3"

class
	EL_MAKE_DIRECTORY_IMPL

inherit
	EL_COMMAND_IMPL

create
	make
	
feature -- Access

	Template: STRING = "[
		mkdir "$directory_path"
	]"
end
