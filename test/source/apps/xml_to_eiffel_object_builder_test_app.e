﻿note
	description: "Test conversion of SMIL and XHTML documents to Eiffel and serialization back to XML."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 17:27:27 GMT (Wednesday 11th March 2015)"
	revision: "6"

class
	XML_TO_EIFFEL_OBJECT_BUILDER_TEST_APP

inherit
	TEST_APPLICATION
		redefine
			Option_name, initialize
		end

create
	make

feature {NONE} -- Initiliazation

	initialize
			--
		do
			Precursor
			create smart_builder.make
		end

feature -- Basic operations

	test_run
			--
		do
			-- Jan 2015
			Test.do_file_test ("XML/creatable/linguistic-analysis.smil", agent build_and_serialize_file, 3564006962)
			Test.do_all_files_test ("XML/creatable", "*", agent build_and_serialize_file, 3315853670)
			Test.do_file_test ("XML/creatable/download-page.xhtml", agent build_and_serialize_file, 3585601868)

--			Test.do_all_files_test ("XML/creatable", "*", agent smart_build_file, 1417327426)
--			Test.do_file_test ("pyxis/translations.xml.pyx", agent read_pyxis_translation_table, 3101056532)
--			Test.do_file_test ("pyxis/credits.xml.pyx", agent read_translation_table (?, False), 919892163)
--			Test.do_file_test ("pyxis/credits.xml.pyx", agent read_translation_table (?, True), 919892163)
		end

feature -- Tests

	read_translation_table (file_path: EL_FILE_PATH; from_source_string: BOOLEAN)
		local
			table: EL_TRANSLATION_TABLE
			text: ASTRING
		do
			if from_source_string then
				create table.make_from_pyxis_source ("en", File_system.plain_text (file_path))
			else
				create table.make_from_pyxis ("en", file_path)
			end
			across table as translation loop
				text := translation.item
				text.replace_substring_all ("%N", "\n")
				log.put_string_field (translation.key, text)
				log.put_new_line
			end
		end

	smart_build_file (file_path: EL_FILE_PATH)
			--
		do
			log.enter_with_args ("smart_build_file", << file_path >>)
			smart_builder.build_from_file (file_path)

			if attached {EL_BUILDABLE_XML_FILE_PERSISTENT} smart_builder.target as storable then
				storable.set_output_path (file_path)
				storable.store
			end
			log.exit
		end

	read_and_save (file_path: EL_FILE_PATH; constructed_object: EVOLICITY_SERIALIZEABLE_AS_XML)
			--
		do
			log.enter_with_args ("read_and_save", << file_path.to_string >>)
			constructed_object.save_as_xml (file_path)
			log.exit
		end

	build_and_serialize_file (file_path: EL_FILE_PATH)
			--
		local
			extension: STRING
		do
			extension := file_path.extension.string
			if extension ~ "xhtml" then
				read_and_save (file_path, create {WEB_FORM}.make_from_file (file_path))

			elseif extension ~ "smil" then
				read_and_save (file_path, create {SMIL_PRESENTATION}.make_from_file (file_path))

			elseif file_path.to_string.has_substring ("matrix") then
				operate_on_matrix (file_path)

			end
		end

	operate_on_matrix (file_in_path: EL_FILE_PATH)
			--
		local
			matrix: MATRIX_CALCULATOR
		do
			log.enter_with_args ("operate_on_matrix", << file_in_path.to_string >>)
			create matrix.make_from_file (file_in_path)
			matrix.find_column_sum
			matrix.find_column_average
			log.exit
		end

	smart_builder: EL_SMART_XML_TO_EIFFEL_OBJECT_BUILDER

feature {NONE} -- Constants

	Option_name: STRING
			--
		once
			Result := "test_x2e_and_e2x"
		end

	Description: STRING
		once
			Result := "Auto test conversion of SMIL and XHTML documents to Eiffel and serialization back to XML"
		end

	Log_filter: ARRAY [like Type_logging_filter]
			--
		do
			Result := <<
				[{XML_TO_EIFFEL_OBJECT_BUILDER_TEST_APP}, All_routines],
				[{EL_TEST_ROUTINES}, All_routines],
				[{SMIL_AUDIO_SEQUENCE}, All_routines],
				[{SMIL_AUDIO_CLIP}, All_routines],
				[{SMIL_PRESENTATION}, All_routines],
				[{WEB_FORM}, All_routines],
				[{WEB_FORM_COMPONENT}, All_routines],
				[{WEB_FORM_DROP_DOWN_LIST}, All_routines],
				[{WEB_FORM_TEXT}, All_routines],
				[{WEB_FORM_LINE_BREAK}, All_routines],
				[{MATRIX_CALCULATOR}, "find_column_sum, find_column_average, set_calculation_procedure, add_row, -add_row_col"]
			>>
		end

end
