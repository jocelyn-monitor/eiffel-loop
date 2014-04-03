note
	description: "Generate HTML cluster manifest of from source tree manifest"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-02-24 11:29:16 GMT (Monday 24th February 2014)"
	revision: "6"

class
	EIFFEL_CLASS_LIBRARY_MANIFEST_APP

inherit
	EL_TESTABLE_COMMAND_LINE_SUB_APPLICATTION [EIFFEL_CLASS_LIBRARY_MANIFEST_COMMAND]
		redefine
			Option_name, Installer
		end

feature -- Testing

	test_run
			--
		do
			-- Test will always fail because of date stamp written to files (different CRC)
			Test.do_file_tree_test ("Eiffel/latin1-sources", agent test_generate_manifest, 312859171)
			Test.do_file_tree_test ("Eiffel/utf8-sources", agent test_generate_manifest, 1079811372)
		end

	test_generate_manifest (a_sources_path: EL_DIR_PATH)
			--
		do
			create command.make (
				a_sources_path + "manifest.pyx", a_sources_path + "index.html",
				"Eiffel LOOP Classes", Execution.current_working_directory
			)
			normal_run
		end

feature {NONE} -- Implementation

	make_action: PROCEDURE [like command, like default_operands]
		do
			Result := agent command.make
		end

	default_operands: TUPLE [
		source_manifest_path, output_path: EL_FILE_PATH
		title: EL_ASTRING
		source_root_path: EL_DIR_PATH
	]
		do
			create Result
			Result.source_manifest_path := ""
			Result.output_path := "index.html"
			Result.title := ""
			Result.source_root_path := ""
		end

	argument_specs: ARRAY [like Type_argument_specification]
		do
			Result := <<
				required_existing_path_argument ("sources", "Path to source manifest file"),
				required_argument ("output", "Output file path"),
				required_argument ("title", "Page title"),
				required_argument ("source_root", "Source root path")
			>>
		end

feature {NONE} -- Constants

	Option_name: STRING = "manifest"

	Description: STRING = "Generate HTML cluster manifest of from source tree manifest"

	Installer: EL_CONTEXT_MENU_SCRIPT_APPLICATION_INSTALLER
		once
			create Result.make ("Eiffel Loop/Development/Create HTML cluster manifest")
		end

	Log_filter: ARRAY [like Type_logging_filter]
			--
		do
			Result := <<
				[{EL_TEST_ROUTINES}, "*"],

				[{EIFFEL_CLASS_LIBRARY_MANIFEST_APP}, "*"],
				[{EIFFEL_CLASS_LIBRARY_MANIFEST_COMMAND}, "*"],
				[{CLASS_INFO}, "-*"]
			>>
		end

end
