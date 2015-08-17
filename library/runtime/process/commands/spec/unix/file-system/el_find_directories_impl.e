﻿note
	description: "Summary description for {EL_FIND_DIRECTORIES_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-24 10:37:24 GMT (Wednesday 24th June 2015)"
	revision: "3"

class
	EL_FIND_DIRECTORIES_IMPL

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

		-type d
	]"

feature -- Not applicable

	prepend_lines (command: EL_FIND_DIRECTORIES_COMMAND; output: PLAIN_TEXT_FILE)
			-- Prepend lines to output file before command has executed
			-- This is to make results of Windows 'dir' command compatible with Unix 'find' command
		do
			-- Do nothing under Unix
		end

end
