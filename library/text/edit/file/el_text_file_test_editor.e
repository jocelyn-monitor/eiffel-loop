note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "4"

deferred class
	EL_TEXT_FILE_TEST_EDITOR

inherit
	EL_TEXT_FILE_EDITOR
		redefine
			new_output, close
		end

feature {NONE} -- Implementation

	new_output: EL_TEXT_IO_MEDIUM
			--
		do
			create Result.make_open_write (source_text.count)
		end

	close
			--
		do
		end

end -- class EL_SOURCE_FILE_EDITOR_TESTER

