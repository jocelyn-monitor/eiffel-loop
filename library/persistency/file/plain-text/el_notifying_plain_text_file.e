﻿note
	description: "Summary description for {EL_NOTIFYING_PLAIN_TEXT_FILE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:33:26 GMT (Thursday 11th December 2014)"
	revision: "4"

class
	EL_NOTIFYING_PLAIN_TEXT_FILE

inherit
	EL_NOTIFYING_FILE
		rename
			index as position
		undefine
			is_plain_text
		end

	PLAIN_TEXT_FILE
		undefine
			make_with_name, open_read, open_write, close, move,
			read_character, read_line, read_to_managed_pointer,
			put_managed_pointer, put_character, put_string, put_new_line
		redefine
			read_integer, read_real, read_to_managed_pointer,
			put_new_line
		end

create
	make_closed, make_with_name, make_open_read, make_open_write, make_open_append,
	make_open_read_write, make_create_read_write,
	make_open_read_append

feature -- Initialization

	make_closed
		do
			make_with_name ("None.txt")
		end

feature -- Input

	read_integer
			-- Read the binary representation of a new 32-bit integer
			-- from file. Make result available in `last_integer'.
		do
			Precursor
			listener.on_read ({PLATFORM}.integer_32_bytes)
		end

	read_real
			-- Read the binary representation of a new real
			-- from file. Make result available in `last_real'.
		do
			Precursor
			listener.on_read ({PLATFORM}.real_32_bytes)
		end

end
