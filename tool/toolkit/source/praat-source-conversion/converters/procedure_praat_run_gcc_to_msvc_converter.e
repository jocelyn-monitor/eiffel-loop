note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-04 10:11:30 GMT (Saturday 4th January 2014)"
	revision: "3"

class
	PROCEDURE_PRAAT_RUN_GCC_TO_MSVC_CONVERTER

inherit
	EL_FILE_EDITING_PROCESSOR
		rename
			make as make_processor,
			output as file_output,
			new_output as actual_file_output
		export
			{FILE_PRAAT_C_GCC_TO_MSVC_CONVERTER} set_source_text
		redefine
			file_output, actual_file_output, close
		end

	EL_C_PATTERN_FACTORY

create
	make

feature {NONE} -- Initialization

	make (a_file_output: PLAIN_TEXT_FILE)
			--
		do
			make_processor
			actual_file_output := a_file_output
		end

feature {NONE} -- C constructs

	delimiting_pattern: EL_MATCH_ALL_IN_LIST_TP
			-- Abbreviated Eg.

			-- if (Melder_batch) {
			--  ..
			-- } else /* GUI */ {
			-- 	..
			-- }
		do
			Result := all_of (<<
				start_of_line,
				non_breaking_white_space,
				string_literal ("if (Melder_batch)"),
				non_breaking_white_space,

				statement_block,

				-- 	else /* GUI */
				non_breaking_white_space,
				string_literal ("else"),
				non_breaking_white_space,
				comment,
				non_breaking_white_space,

				statement_block

			>>) |to| agent on_if_melder_batch_statement_block
		end

feature {NONE} -- Match actions

	on_if_melder_batch_statement_block (text: EL_STRING_VIEW)
			--
		do
			put_new_line
			put_string ("%T#if ! defined (EIFFEL_APPLICATION)")
			put_new_line
			put_string (text)
			put_new_line
			put_string ("%T#endif%T//defined ! (EIFFEL_APPLICATION)")

		end

feature {NONE} -- Implementation

	actual_file_output: PLAIN_TEXT_FILE

	file_output: PLAIN_TEXT_FILE

	close
			--
		do
		end

end
