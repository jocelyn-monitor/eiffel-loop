note
	description: "Summary description for {CHARACTER_STATE_MACHINE_TEST_APP}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2013 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-06-22 12:28:37 GMT (Saturday 22nd June 2013)"
	revision: "2"

class
	CHARACTER_STATE_MACHINE_TEST_APP

inherit
	TEST_APPLICATION
		redefine
			option_name
		end

create
	make

feature -- Basic operations

	run
			--
		do
			Test.do_file_test ({STRING_32} "csv/JobServe.csv", agent test_csv_parse, 725046562)
		end

feature -- Test

	test_csv_parse (file_path: EL_FILE_PATH)
			--
		local
			csv_file: EL_COMMA_SEPARATED_FILE
		do
			log.enter ("test_csv_parse")
			create csv_file.make (file_path)
			across csv_file.lines as line loop
				log.put_integer_field ("Field count", line.item.count)
				log.put_string_field (" field [1]", line.item [1])
				log.put_new_line
			end
			log.exit
		end

feature {NONE} -- Constants

	Option_name: STRING = "test_state_machine"

	Description: STRING = "Test agent based character string state machine"

	Log_filter: ARRAY [like Type_logging_filter]
			--
		do
			Result := <<
				[{CHARACTER_STATE_MACHINE_TEST_APP}, "*"],
				[{EL_TEST_ROUTINES}, "*"]
			>>
		end

end
