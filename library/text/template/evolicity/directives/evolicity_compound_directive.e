note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-22 18:09:59 GMT (Friday 22nd November 2013)"
	revision: "3"

class
	EVOLICITY_COMPOUND_DIRECTIVE

inherit
	EVOLICITY_DIRECTIVE
		undefine
			copy, is_equal
		end

	ARRAYED_LIST [EVOLICITY_DIRECTIVE]
		rename
			make as make_array
		end

create
	make

feature -- Initialization

	make
			--
		do
			make_array (7)
		end

feature -- Access

	minimum_buffer_length: INTEGER
			-- Suggested minimum buffer length to use for output

feature -- Element change

	set_minimum_buffer_length (a_minimum_buffer_length: like minimum_buffer_length)
			-- Set `minimum_buffer_length' to `a_minimum_buffer_length'.
		do
			minimum_buffer_length := a_minimum_buffer_length
		ensure
			minimum_buffer_length_assigned: minimum_buffer_length = a_minimum_buffer_length
		end

feature -- Basic operations

	execute (context: EVOLICITY_CONTEXT; output: IO_MEDIUM; utf8_encoded: BOOLEAN)
			--
		do
			from start until off loop
				item.execute (context, output, utf8_encoded)
				forth
			end
		end

end -- class EVOLICITY_COMPOUND_DIRECTIVE

