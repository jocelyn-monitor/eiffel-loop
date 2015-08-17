﻿note
	description: "Summary description for {PYXIS_TO_XML_CONVERTER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-22 17:22:45 GMT (Friday 22nd May 2015)"
	revision: "6"

class
	PYXIS_TO_XML_CONVERTER

inherit
	EL_COMMAND

	EL_MODULE_LOG

create
	make, default_create

feature {EL_COMMAND_LINE_SUB_APPLICATION} -- Initialization

	make (a_source_path, a_output_path: EL_FILE_PATH)
		local
			extension: ASTRING
		do
			source_path  := a_source_path
			output_path := a_output_path
			create xml_generator.make

			if output_path.is_empty then
				extension := source_path.extension
				if extension.same_string ("pecf") then
					output_path := source_path.with_new_extension ("ecf")
				else
					output_path := source_path.without_extension
				end
			end

		end

feature -- Basic operations

	execute
			--
		local
			in_file: PLAIN_TEXT_FILE; out_file: EL_PLAIN_TEXT_FILE
			encoding: EL_PYXIS_ENCODING
		do
			log.enter ("run")
			log_or_io.put_path_field ("Converting", source_path)
			log_or_io.put_new_line

			create encoding.make_from_file (source_path)

			create in_file.make_open_read (source_path)
			create out_file.make_open_write (output_path)
			out_file.set_encoding_from_other (encoding)

			xml_generator.convert_stream (in_file, out_file)
			in_file.close
			out_file.close
			log.exit
		end

feature {NONE} -- Implementation

	source_path: EL_FILE_PATH

	output_path: EL_FILE_PATH

	xml_generator: EL_PYXIS_XML_TEXT_GENERATOR

end
