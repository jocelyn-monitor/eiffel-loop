note
	description: "Summary description for {EL_UTF_8_LINE_READER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "5"

class
	EL_UTF_8_ENCODED_LINE_READER [F -> FILE]

inherit
	EL_LINE_READER [F]

create
	default_create

feature -- Element change

	set_line (raw_line: STRING)
		do
			create line.make_from_utf8 (raw_line)
		end

end
