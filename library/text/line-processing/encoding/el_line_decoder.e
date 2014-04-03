note
	description: "Summary description for {EL_LINE_READER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-21 14:06:00 GMT (Thursday 21st November 2013)"
	revision: "4"

deferred class
	EL_LINE_DECODER [F -> FILE]

inherit
	ANY
		redefine
			default_create
		end

	EL_MODULE_UTF
		undefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
		do
			create line.make_empty
		end

feature -- Element change

	set_line_from_file (source: F)
		require
			source_open: source.is_open_read
			line_available: not source.after
		do
			source.read_line
			set_line (source.last_string)
			line.prune_all_trailing ('%R')
		end

	set_line (raw_line: STRING)
		deferred
		end

feature -- Access

	line: EL_ASTRING

end
