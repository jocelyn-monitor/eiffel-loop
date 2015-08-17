﻿note
	description: "Object that can read and write itself to memory buffer EL_MEMORY_READER_WRITER"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-19 8:51:19 GMT (Tuesday 19th May 2015)"
	revision: "4"

deferred class
	EL_STORABLE

inherit
	EL_REFLECTOR_CONSTANTS
		export
			{EL_MEMORY_READER_WRITER} generating_type
		redefine
			is_equal
		end

feature {EL_MEMORY_READER_WRITER} -- Initialization

	make_default
		deferred
		end

feature -- Basic operations

	read (a_reader: EL_MEMORY_READER_WRITER)
		do
			if a_reader.is_default_data_version then
				read_default (a_reader)
			else
				read_version (a_reader, a_reader.data_version)
			end
		end

	write (a_writer: EL_MEMORY_READER_WRITER)
		local
			i, field_count: INTEGER
			current_object: REFLECTED_REFERENCE_OBJECT
			exclusions: like Once_excluded_fields
		do
			current_object := new_current_object
			field_count := current_object.field_count
			exclusions := Once_excluded_fields
			from i := 1 until i > field_count loop
				if not exclusions.has (i) then
					write_field (i, current_object, a_writer)
				end
				i := i + 1
			end
			Reflected_object_pool.put (current_object)
		ensure
			reversable: Current ~ a_writer.retrieved (old a_writer.count)
		end

feature -- Status query

	is_deleted: BOOLEAN

feature -- Status change

	delete
			-- mark item as deleted
		do
			is_deleted := True
		end

	undelete
		do
			is_deleted := False
		end

feature -- Basic operations

	print_info
		do
		end

feature {EL_STORABLE} -- Implementation

	read_default (a_reader: EL_MEMORY_READER_WRITER)
			-- Read default (current) version of data
		local
			i, field_count: INTEGER
			current_object: REFLECTED_REFERENCE_OBJECT
			exclusions: like Once_excluded_fields
		do
			current_object := new_current_object
			field_count := current_object.field_count
			exclusions := Once_excluded_fields
			from i := 1 until i > field_count loop
				if not exclusions.has (i) then
					read_field (i, current_object, a_reader)
				end
				i := i + 1
			end
			Reflected_object_pool.put (current_object)
		end

	read_default_version (a_reader: EL_MEMORY_READER_WRITER; version: NATURAL)
			-- Read version compatible with default version
		do
			read_default (a_reader)
		end

	read_version (a_reader: EL_MEMORY_READER_WRITER; version: NATURAL)
			-- Read version compatible with software version
		deferred
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		local
			i, field_count: INTEGER
			current_object, other_object: REFLECTED_REFERENCE_OBJECT
			exclusions: like Once_excluded_fields
		do
			current_object := new_current_object; other_object := new_current_object
			other_object.set_object (other)
			field_count := current_object.field_count
			exclusions := Once_excluded_fields
			Result := True
			from i := 1 until i > field_count or else not Result loop
				if not exclusions.has (i) then
					Result := Result and equal_fields (i, current_object, other_object)
				end
				i := i + 1
			end
			Reflected_object_pool.put (current_object)
		end

feature {NONE} -- Implementation

	excluded_field_names: ARRAY [STRING]
		do
			create Result.make_empty
		end

	equal_fields (field: INTEGER; current_object, other_object: REFLECTED_REFERENCE_OBJECT): BOOLEAN
		local
			type_id: INTEGER; reference_item, other_reference_item: ANY
		do
			type_id := current_object.field_type (field)
			inspect type_id
				when Boolean_type then
					Result := current_object.boolean_field (field) = other_object.boolean_field (field)	 		-- BOOLEAN

				when Integer_8_type then
					Result := current_object.integer_8_field (field) = other_object.integer_8_field (field) 	-- INTEGER_8

				when Integer_16_type then
					Result := current_object.integer_16_field (field) = other_object.integer_16_field (field) -- INTEGER_16

				when Integer_32_type then
					Result := current_object.integer_32_field (field) = other_object.integer_32_field (field) -- INTEGER_32

				when Integer_64_type then
					Result := current_object.integer_64_field (field) = other_object.integer_64_field (field) -- INTEGER_64

				when Real_32_type then
					Result := current_object.real_32_field (field) = other_object.real_32_field (field)			-- REAL_32

				when Real_64_type then
					Result := current_object.real_64_field (field) = other_object.real_64_field (field)			-- REAL_64

				when Natural_8_type then
					Result := current_object.natural_8_field (field) = other_object.natural_8_field (field)	-- NATURAL_8

				when Natural_16_type then
					Result := current_object.natural_16_field (field) = other_object.natural_16_field (field)	-- NATURAL_16

				when Natural_32_type then
					Result := current_object.natural_32_field (field)  = other_object.natural_32_field (field)-- NATURAL_32

				when Natural_64_type then
					Result := current_object.natural_64_field (field) = other_object.natural_64_field (field) -- NATURAL_64
			else
				type_id := current_object.field_static_type (field)
				reference_item := current_object.reference_field (field)
				other_reference_item := other_object.reference_field (field)
				if type_id = Astring_type or else type_id = String_8_type or else type_id = String_32_type	-- ASTRING or STRING
					or else attached {EL_STORABLE} reference_item															-- EL_STORABLE
					or else attached {TUPLE} reference_item as tuple and then tuple.object_comparison			-- TUPLE
				then
					Result := reference_item ~ other_reference_item
				else
					Result := True
				end
			end
		end

	excluded_fields: like Once_excluded_fields
			-- array of indexes of excluded fields
		local
			i, field_count: INTEGER
			current_object: REFLECTED_REFERENCE_OBJECT
			names: ARRAYED_LIST [STRING]; l_result: ARRAYED_LIST [INTEGER]
		do
			current_object := new_current_object
			field_count := current_object.field_count
			create names.make_from_array (excluded_field_names)
			names.extend ("is_deleted")
			names.compare_objects
			create l_result.make (names.count)
			from i := 1 until i > field_count loop
				if names.has (current_object.field_name (i)) then
					l_result.extend (i)
				end
				i := i + 1
			end
			Result := l_result.to_array
			Reflected_object_pool.put (current_object)
		end

	new_current_object: REFLECTED_REFERENCE_OBJECT
		local
			pool: like Reflected_object_pool
		do
			pool := Reflected_object_pool
			if pool.is_empty then
				create Result.make (Current)
			else
				Result := pool.item
				Result.set_object (Current)
				pool.remove
			end
		end

	read_field (field: INTEGER; current_object: REFLECTED_REFERENCE_OBJECT; a_reader: EL_MEMORY_READER_WRITER)
		local
			type_id: INTEGER
		do
			type_id := current_object.field_type (field)
			inspect type_id
				when Boolean_type then
					current_object.set_boolean_field (field, a_reader.read_boolean)		 	-- BOOLEAN

				when Integer_8_type then
					current_object.set_integer_8_field (field, a_reader.read_integer_8) 		-- INTEGER_8

				when Integer_16_type then
					current_object.set_integer_16_field (field, a_reader.read_integer_16) 	-- INTEGER_16

				when Integer_32_type then
					current_object.set_integer_32_field (field, a_reader.read_integer_32) 	-- INTEGER_32

				when Integer_64_type then
					current_object.set_integer_64_field (field, a_reader.read_integer_64) 	-- INTEGER_64

				when Real_type then
					current_object.set_real_32_field (field, a_reader.read_real_32)			-- REAL

				when Real_64_type then
					current_object.set_real_64_field (field, a_reader.read_real_32)			-- REAL_64

				when Natural_8_type then
					current_object.set_natural_16_field (field, a_reader.read_natural_8) 	-- NATURAL_8

				when Natural_16_type then
					current_object.set_natural_16_field (field, a_reader.read_natural_16) 	-- NATURAL_16

				when Natural_32_type then
					current_object.set_natural_32_field (field, a_reader.read_natural_32) 	-- NATURAL_32

				when Natural_64_type then
					current_object.set_natural_64_field (field, a_reader.read_natural_64) 	-- NATURAL_64
			else
				read_reference_field (field, current_object, a_reader)
			end
		end

	read_reference_field (field: INTEGER; current_object: REFLECTED_REFERENCE_OBJECT; a_reader: EL_MEMORY_READER_WRITER)
		local
			type_id: INTEGER; reference_item: ANY
		do
			type_id := current_object.field_static_type (field)
			if type_id = Astring_type then
				current_object.set_reference_field (field, a_reader.read_string)			-- ASTRING

			elseif type_id = String_8_type then
				current_object.set_reference_field (field, a_reader.read_string_8)		-- STRING_8

			elseif type_id = String_32_type then
				current_object.set_reference_field (field, a_reader.read_string_32)		-- STRING_32

			else
				reference_item := current_object.reference_field (field)
				if attached {EL_STORABLE} reference_item as readable then
					readable.read (a_reader)															-- EL_STORABLE

				elseif attached {TUPLE} reference_item as tuple then
					read_tuple (tuple, a_reader)														-- TUPLE
				end
			end
		end

	read_tuple (tuple: TUPLE; a_reader: EL_MEMORY_READER_WRITER)
		local
			i: INTEGER; reference_item: ANY
		do
			from i := 1 until i > tuple.count loop
				if tuple.is_boolean_item (i) then
					tuple.put_boolean (a_reader.read_boolean, i)						-- BOOLEAN
				elseif tuple.is_integer_32_item (i) then
					tuple.put_integer (a_reader.read_integer_32, i)					-- INTEGER
				elseif tuple.is_reference_item (i) then
					reference_item := tuple.reference_item (i)
					if attached {ASTRING} reference_item as astring then
						tuple.put_reference (a_reader.read_string, i)				-- ASTRING
					elseif attached {STRING} reference_item as string then
						tuple.put_reference (a_reader.read_string_8, i)				-- STRING
					end
				end
				i := i + 1
			end
		end

	write_field (field: INTEGER; current_object: REFLECTED_REFERENCE_OBJECT; a_writer: EL_MEMORY_READER_WRITER)
		local
			type_id: INTEGER
		do
			type_id := current_object.field_type (field)
			inspect type_id
				when Boolean_type then
					a_writer.write_boolean (current_object.boolean_field (field)) 				-- BOOLEAN

				when Integer_8_type then
					a_writer.write_integer_8 (current_object.integer_8_field (field)) 		-- INTEGER_8

				when Integer_16_type then
					a_writer.write_integer_16 (current_object.integer_16_field (field)) 		-- INTEGER_16

				when Integer_32_type then
					a_writer.write_integer_32 (current_object.integer_32_field (field)) 		-- INTEGER_32

				when Integer_64_type then
					a_writer.write_integer_64 (current_object.integer_64_field (field)) 		-- INTEGER_64

				when Real_32_type then
					a_writer.write_real_32 (current_object.real_32_field (field)) 				-- REAL_32

				when Real_64_type then
					a_writer.write_real_64 (current_object.real_64_field (field)) 				-- REAL_64

				when Natural_8_type then
					a_writer.write_natural_8 (current_object.natural_8_field (field)) 		-- NATURAL_8

				when Natural_16_type then
					a_writer.write_natural_16 (current_object.natural_16_field (field)) 		-- NATURAL_16

				when Natural_32_type then
					a_writer.write_natural_32 (current_object.natural_32_field (field)) 		-- NATURAL_32

				when Natural_64_type then
					a_writer.write_natural_64 (current_object.natural_64_field (field)) 		-- NATURAL_64

				when Reference_type then
					write_reference_field (current_object.reference_field (field), a_writer)
			else
			end
		end

	write_reference_field (item: ANY; a_writer: EL_MEMORY_READER_WRITER)
		do
			if attached {ASTRING} item as astring then
				a_writer.write_string (astring)					-- ASTRING

			elseif attached {STRING} item as string then
				a_writer.write_string_8 (string)					-- STRING

			elseif attached {EL_STORABLE} item as writeable then
				writeable.write (a_writer)							-- EL_MEMORY_READ_WRITEABLE

			elseif attached {TUPLE} item as tuple then
				write_tuple (tuple, a_writer)						-- TUPLE
			end
		end

	write_tuple (tuple: TUPLE; a_writer: EL_MEMORY_READER_WRITER)
		local
			i: INTEGER
		do
			from i := 1 until i > tuple.count loop
				if tuple.is_boolean_item (i) then
					a_writer.write_boolean (tuple.boolean_item (i))					-- BOOLEAN
				elseif tuple.is_integer_32_item (i) then
					a_writer.write_integer_32 (tuple.integer_32_item (i))			-- INTEGER
				elseif tuple.is_reference_item (i) then
					write_reference_field (tuple.reference_item (i), a_writer)
				end
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Once_excluded_fields: ARRAY [INTEGER]
		once
			create Result.make_empty
		end

	Reflected_object_pool: ARRAYED_STACK [REFLECTED_REFERENCE_OBJECT]
		once
			create Result.make (3)
		end

end
