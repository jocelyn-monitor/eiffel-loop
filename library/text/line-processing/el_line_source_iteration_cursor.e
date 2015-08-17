﻿note
	description: "Summary description for {EL_FILE_STRING_LIST_ITERATION_CURSOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:27 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	EL_LINE_SOURCE_ITERATION_CURSOR [F -> FILE]

inherit
	ITERATION_CURSOR [ASTRING]

create
	make

feature {NONE} -- Initialization

	make (a_line_source: like line_source)
		do
			line_source := a_line_source
		end

feature -- Access

	item: ASTRING
			-- Item at current cursor position.
		do
			Result := line_source.item
		end

	cursor_index: INTEGER
		do
			Result := line_source.index
		end

feature -- Status report	

	after: BOOLEAN
		do
			Result := line_source.after
		end

feature -- Cursor movement

	start
			-- Move to first position if any.
		do
			line_source.start
		end

	forth
			--
		do
			line_source.forth
		end

feature {NONE} -- Implementation

	line_source: EL_LINE_SOURCE [F]

end
