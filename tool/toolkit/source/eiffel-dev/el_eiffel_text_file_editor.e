note
	description: "Summary description for {EL_EIFFEL_TEXT_FILE_EDITOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:36 GMT (Thursday 11th December 2014)"
	revision: "6"

deferred class
	EL_EIFFEL_TEXT_FILE_EDITOR

inherit
	EL_TEXT_FILE_EDITOR
		undefine
			put_string
		end

	EL_EIFFEL_TEXT_EDITOR
		rename
			set_source_text_from_file as set_input_file_path
		end
end
