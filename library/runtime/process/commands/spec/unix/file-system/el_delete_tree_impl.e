﻿note
	description: "Summary description for {EL_DELETE_TREE_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-24 10:36:16 GMT (Wednesday 24th June 2015)"
	revision: "3"

class
	EL_DELETE_TREE_IMPL

inherit
	EL_COMMAND_IMPL

create
	make

feature -- Access

	template: STRING = "[
		rm -r "$target_path"
	]"

end
