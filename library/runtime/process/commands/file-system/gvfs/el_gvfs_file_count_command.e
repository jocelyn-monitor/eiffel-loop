﻿note
	description: "[
		Parses output of command: gvfs-ls "$uri" | grep -c "^.*$"
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 14:03:52 GMT (Wednesday 11th March 2015)"
	revision: "2"

class
	EL_GVFS_FILE_COUNT_COMMAND

inherit
	EL_LINE_PROCESSED_OS_COMMAND
		rename
			find_line as read_count
		redefine
			default_create, read_count
		end

create
	default_create

feature {NONE} -- Initialization

	default_create
		do
			make_with_name ("gvfs-ls.count_lines", "[
				gvfs-ls "$uri" | grep -c "^.*$"
			]")
		end

feature -- Access

	is_empty: BOOLEAN
		do
			Result := count = 0
		end

	count: INTEGER

feature -- Element change

	reset
		do
			count := 0
		end

feature {NONE} -- Line states

	read_count (line: ASTRING)
		do
			if line.is_integer then
				count := line.to_integer
				state := agent final
			end
		end

end
