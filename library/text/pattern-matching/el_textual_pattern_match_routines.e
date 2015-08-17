note
	description: "Summary description for {EL_TEXTUAL_PATTERN_MATCH_ROUTINES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	EL_TEXTUAL_PATTERN_MATCH_ROUTINES

inherit
	EL_TEXT_MATCHER
		rename
			is_match as is_text_match,
			contains_match as text_contains_match,
			occurrences as text_occurrences
		end

	EL_TEXTUAL_PATTERN_FACTORY

create
	make

feature -- Basic operations

	is_match (a_string: STRING; a_pattern: EL_TEXTUAL_PATTERN): BOOLEAN
			--
		do
			pattern := a_pattern
			Result := is_text_match (a_string)
		end

	contains_match (a_string: STRING; a_pattern: EL_TEXTUAL_PATTERN): BOOLEAN
			--
		do
			Result := occurrences (a_string, a_pattern) > 1
		end

	occurrences (a_string: STRING; a_pattern: EL_TEXTUAL_PATTERN): INTEGER
			--
		do
			pattern := a_pattern
			Result := text_occurrences (a_string)
		end

end
