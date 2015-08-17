﻿note
	description: "Summary description for {EL_FIND_FILES_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-24 10:37:13 GMT (Wednesday 24th June 2015)"
	revision: "3"

class
	EL_FIND_FILES_IMPL

inherit
	EL_FIND_COMMAND_IMPL

create
	make

feature -- Access

	template: STRING = "[
		find 
		#if $follow_symbolic_links then
			-L
		#end
		"$path"
		#if not $is_recursive then
			-maxdepth 1
		#end
	 	-type f -name "$file_pattern"
	]"

end
