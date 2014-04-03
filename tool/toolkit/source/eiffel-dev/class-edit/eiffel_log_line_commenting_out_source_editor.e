note
	description: "[
		Objects that comments out and comments in 'log.xxx' lines
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-02-21 9:45:11 GMT (Friday 21st February 2014)"
	revision: "2"

class
	EIFFEL_LOG_LINE_COMMENTING_OUT_SOURCE_EDITOR

inherit
	EIFFEL_SOURCE_EDITING_PROCESSOR
		redefine
			make
		end

create
	make

feature {NONE} -- Initialization

	make
			--
		do
			Precursor
			create string_tokenizer_by_new_line.make (<<'%N'>>)
			create string_tokenizer_by_eiffel_comment_marker.make_with_delimiter (
				Eiffel_comment_marker
			)
		end

feature {NONE} -- Pattern definitions

	search_patterns: ARRAYED_LIST [EL_TEXTUAL_PATTERN]
		do
			create Result.make_from_array (<<
				new_line_character |to| agent on_unmatched_text,
				logging_statement  |to| agent on_logging_statement
			>>)
		end

	logging_statement: EL_FIRST_MATCH_IN_LIST_TP
			--
		do
			Result := one_of (<< logging_command, redirect_thread_to_console_command >>)
		end

	logging_command: EL_MATCH_ALL_IN_LIST_TP
			--
		do
			Result := all_of ( <<
				maybe_non_breaking_white_space,
				one_of (<<
					string_literal ("log."),
					string_literal ("log_or_io.")
				>>),
				identifier,
				all_of (<<
					maybe_white_space,
					bracketed_eiffel_expression
				>>) #occurs (0 |..| 1)
			>> )
		end

	redirect_thread_to_console_command: EL_MATCH_ALL_IN_LIST_TP
			--
		do
			Result := all_of ( <<
				maybe_non_breaking_white_space,
				string_literal ("redirect_thread_to_console"),
				maybe_non_breaking_white_space,
				all_of (<<
					character_literal ('('),
					numeric_constant,
					character_literal (')')
				>>)
			>> )
		end

feature {NONE} -- Parsing actions

	on_logging_statement (text: EL_STRING_VIEW)
			--
		do
			log.enter_with_args ("on_logging_statement", <<text>>)
			string_tokenizer_by_new_line.set_from_string (text)
			from
				string_tokenizer_by_new_line.start
			until
				string_tokenizer_by_new_line.off
			loop
				put_string ("--")
				put_string (string_tokenizer_by_new_line.item)
				string_tokenizer_by_new_line.forth
				if not string_tokenizer_by_new_line.off then
					put_new_line
				end
			end
			log.exit
		end

feature {NONE} -- Implementation

	string_tokenizer_by_new_line: EL_SPLIT_STRING_LIST

	string_tokenizer_by_eiffel_comment_marker: EL_SPLIT_STRING_LIST

end

