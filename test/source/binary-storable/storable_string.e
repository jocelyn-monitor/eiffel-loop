note
	description: "Summary description for {STORABLE_STRING}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-04 9:59:56 GMT (Saturday 4th January 2014)"
	revision: "3"

class
	STORABLE_STRING

inherit
	STRING

	EL_MEMORY_READ_WRITEABLE
		undefine
			copy, is_equal, out
		end

create
	make_empty

feature {NONE} -- Implementation

	read_default (a_reader: EL_MEMORY_READER_WRITER)
		do
			wipe_out
			append (a_reader.read_string_8)
		end

	write (a_writer: EL_MEMORY_READER_WRITER)
		do
			a_writer.write_string_8 (Current)
		end

feature {NONE} -- Contract Support

	new_item: like Current
		do
			create Result.make_empty
		end
end
