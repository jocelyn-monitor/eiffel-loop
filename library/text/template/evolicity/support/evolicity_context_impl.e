﻿note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "4"

class
	EVOLICITY_CONTEXT_IMPL

inherit
	EVOLICITY_CONTEXT

create
	make, make_from_string_table, make_from_object_table

feature {NONE} -- Initialization

	make
			--
		do
			create objects
			objects.compare_objects
		end

	make_from_string_table (table: HASH_TABLE [STRING, STRING])

		do
			create objects.make_equal (table.capacity)
			from table.start until table.after loop
				put_variable (table.item_for_iteration, table.key_for_iteration)
				table.forth
			end
		end

	make_from_object_table (object_table: like objects)
			--
		do
			create objects.make_equal (object_table.capacity)
			objects.merge (object_table)
		end

feature -- Access

	objects: EVOLICITY_OBJECT_TABLE [ANY]

end -- class EVOLICITY_CONTEXT_IMPL
