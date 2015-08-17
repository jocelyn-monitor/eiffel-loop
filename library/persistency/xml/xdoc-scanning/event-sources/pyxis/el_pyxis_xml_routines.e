﻿note
	description: "Summary description for {EL_PYXIS_XML_ROUTINES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:30 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	EL_PYXIS_XML_ROUTINES

inherit
	EL_MODULE_FILE_SYSTEM

feature -- Status query

	is_pyxis_file (a_pyxis_file_path: EL_FILE_PATH): BOOLEAN
		do
			Result := File_system.line_one (a_pyxis_file_path).starts_with ("pyxis-doc:")
		end

feature -- Basic operations

	convert_to_xml (a_pyxis_file_path: EL_FILE_PATH; xml_out: EL_OUTPUT_MEDIUM)
		require
			is_pyxis_file: is_pyxis_file (a_pyxis_file_path)
		local
			xml_generator: EL_PYXIS_XML_TEXT_GENERATOR
			pyxis_in: PLAIN_TEXT_FILE
		do
			create pyxis_in.make_open_read (a_pyxis_file_path)
			create xml_generator.make
			xml_generator.convert_stream (pyxis_in, xml_out)
			pyxis_in.close
		end

feature -- Access

	to_xml (a_pyxis_file_path: EL_FILE_PATH): ASTRING
		local
			xml_out: EL_TEXT_IO_MEDIUM
		do
			create xml_out.make_open_write (File_system.file_byte_count (a_pyxis_file_path))
			convert_to_xml (a_pyxis_file_path, xml_out)
			xml_out.close
			Result := xml_out.text
		end

end
