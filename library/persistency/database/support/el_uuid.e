note
	description: "Summary description for {EL_UUID}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-04 9:47:47 GMT (Saturday 4th January 2014)"
	revision: "3"

class
	EL_UUID

inherit
	UUID
		undefine
			is_equal
		end

	EL_MEMORY_READ_WRITEABLE
		undefine
			out, is_equal
		end

create
	default_create, make, make_from_string

feature -- Element change

	read_default (a_reader: EL_MEMORY_READER_WRITER)
		do
			make (
				a_reader.read_natural_32,
				a_reader.read_natural_16, a_reader.read_natural_16, a_reader.read_natural_16,
				a_reader.read_natural_64
			)
		end

feature -- Basic operations

	write (a_writer: EL_MEMORY_READER_WRITER)
		do
			a_writer.write_natural_32 (data_1)
			a_writer.write_natural_16 (data_2); a_writer.write_natural_16 (data_3); a_writer.write_natural_16 (data_4)
			a_writer.write_natural_64 (data_5)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := data_1 = other.data_1
				and then data_2 = other.data_2
				and then data_3 = other.data_3
				and then data_4 = other.data_4
				and then data_5 = other.data_5
		end

feature -- Constants

	Byte_count: INTEGER
		once
			Result := (32 + 16 * 3 + 64) // 8
		end

feature {NONE} -- Contract Support

	new_item: like Current
		do
			create Result
		end
end
