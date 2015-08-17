﻿note
	description: "[
		Change syntax of default_pointers references: 
			ptr /= default_pointer TO is_attached (ptr)
			ptr = default_pointer TO not is_attached (ptr)
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:47:28 GMT (Wednesday 11th March 2015)"
	revision: "4"

class
	EIFFEL_UPGRADE_DEFAULT_POINTER_SYNTAX_EDITOR


inherit
	EIFFEL_SOURCE_EDITING_PROCESSOR

create
	make

feature {NONE} -- Initialization

	make
			--
		do
			make_default
			create variable_name.make_empty
		end

feature {NONE} -- Pattern definitions

	search_patterns: ARRAYED_LIST [EL_TEXTUAL_PATTERN]
		do
			create Result.make_from_array (<<
				pointer_comparison,
				unmatched_identifier_plus_white_space -- skips to next identifier
			>>)
		end

	pointer_comparison: EL_MATCH_ALL_IN_LIST_TP
			--
		do
			Result := all_of_separated_by (one_or_two_spaces, <<
				identifier |to| agent on_variable_name,
				one_of (<<
					string_literal ("/="),
					string_literal ("=")
				>>) |to| agent on_comparison_operator,
				default_pointer_name
			>> )
			Result.set_action_on_match_end (agent on_pointer_comparison)
		end

	default_pointer_name: EL_MATCH_ALL_IN_LIST_TP
			--
		do
			Result := all_of ( << one_character_from ("Dd"), string_literal ("efault_pointer")>> )
		end

	one_or_two_spaces: EL_MATCH_COUNT_WITHIN_BOUNDS_TP
		do
			Result := character_literal (' ') #occurs (1 |..| 2)
		end

feature {NONE} -- Parsing actions

	on_variable_name (text: EL_STRING_VIEW)
			--
		do
			variable_name := text
		end

	on_pointer_comparison (text: EL_STRING_VIEW)
			--
		do
			if is_equal_comparison then
				put_string (Template_unattached #$ [variable_name])
			else
				put_string (Template_attached #$ [variable_name])
			end
		end

	on_comparison_operator (text: EL_STRING_VIEW)
			--
		do
			is_equal_comparison := text.to_string_8.item (1) = '='
		end

feature {NONE} -- Implementation

	variable_name: STRING

	is_equal_comparison: BOOLEAN

	Template_attached: ASTRING
		do
			Result := "is_attached ($S)"
		end

	Template_unattached: ASTRING
		do
			Result := "not is_attached ($S)"
		end
end
