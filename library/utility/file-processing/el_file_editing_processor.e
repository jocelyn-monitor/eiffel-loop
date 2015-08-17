﻿note
	description: "Source file converter that overwrites source file with conversion"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-01-01 12:41:31 GMT (Thursday 1st January 2015)"
	revision: "3"

deferred class
	EL_FILE_EDITING_PROCESSOR

inherit
	EL_TEXT_FILE_EDITOR
		rename
			edit_text as edit_file,
			set_input_file_path as set_convertor_input_file_path
		end

	EL_FILE_PROCESSOR
		rename
			set_file_path as set_input_file_path,
			execute as edit_file
		redefine
			set_input_file_path
		end

feature {NONE} -- Initialization

 	make_from_file (a_file_path: EL_FILE_PATH)
 			--
 		do
 			make_default
 			set_input_file_path (a_file_path)
 		end

feature -- Element change

 	set_input_file_path (a_file_path: EL_FILE_PATH)
 			--
 		do
 			Precursor (a_file_path)
			set_convertor_input_file_path (a_file_path)
 			set_output_file_path (a_file_path)
 		end

end -- class EL_SOURCE_FILE_EDITOR

