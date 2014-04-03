note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-05 13:18:29 GMT (Sunday 5th January 2014)"
	revision: "2"

deferred class
	EL_TEXT_FILE_TEST_EDITOR

inherit
	EL_TEXT_FILE_EDITOR
		redefine
			new_output, close
		end

feature {NONE} -- Implementation

	new_output: IO_MEDIUM
			--
		do
			Result := io.output
		end

	close
			--
		do
		end

end -- class EL_SOURCE_FILE_EDITOR_TESTER

