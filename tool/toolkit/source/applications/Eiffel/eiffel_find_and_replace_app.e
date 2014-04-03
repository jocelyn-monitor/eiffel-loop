note
	description: "Find and replace operating on a source manifest file"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-02-24 11:30:59 GMT (Monday 24th February 2014)"
	revision: "3"

class
	EIFFEL_FIND_AND_REPLACE_APP

inherit
	EL_TESTABLE_COMMAND_LINE_SUB_APPLICATTION [EIFFEL_FIND_AND_REPLACE_COMMAND]
		redefine
			Option_name
		end

feature -- Testing

	test_run
			--
		do
			-- Test will always fail because of date stamp written to files (different CRC)
			Test.do_file_tree_test ("Eiffel/latin1-sources", agent test_find_replace (?, " is", " -- is"), 3042838246)
			Test.do_file_tree_test ("Eiffel/utf8-sources", agent test_find_replace (?, " is", " -- is"), 3042838246)
		end

	test_find_replace (a_sources_path: EL_DIR_PATH; find_text, replacement_text: STRING)
			--
		do
			create command.make (a_sources_path + "manifest.pyx", find_text, replacement_text)
			normal_run
		end

feature {NONE} -- Implementation

	make_action: PROCEDURE [like command, like default_operands]
		do
			Result := agent command.make
		end

	default_operands: TUPLE [source_manifest_path: EL_FILE_PATH; find_text, replacement_text: STRING]
		do
			create Result
			Result.source_manifest_path := ""
			Result.find_text := ""
			Result.replacement_text := ""
		end

	argument_specs: ARRAY [like Type_argument_specification]
		do
			Result := <<
				required_existing_path_argument ("sources", "Path to sources manifest file"),
				required_argument ("find", "Text to find in source files"),
				required_argument ("replace", "Replacement text")
			>>
		end

feature {NONE} -- Constants

	Checksum: NATURAL = 0

	Option_name: STRING = "find_replace"

	Description: STRING = "Finds and replaces text in Eiffel source files"

	Log_filter: ARRAY [like Type_logging_filter]
			--
		do
			Result := <<
				[{EIFFEL_FIND_AND_REPLACE_APP}, "*"],
				[{EIFFEL_FIND_AND_REPLACE_COMMAND}, "*"],
				[{EL_TEST_ROUTINES}, "*"]
			>>
		end

end
