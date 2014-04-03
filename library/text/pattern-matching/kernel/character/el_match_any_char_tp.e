note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2012 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2012-12-16 11:34:32 GMT (Sunday 16th December 2012)"
	revision: "1"

class
	EL_MATCH_ANY_CHAR_TP

inherit
	EL_SINGLE_CHAR_TEXTUAL_PATTERN

create
	default_create

feature {NONE} -- Implementation

	actual_try_to_match
			--
		do
			if target_text.count > 0 then
				match_succeeded := true
				count_characters_matched := 1
			end
		end

end -- class EL_MATCH_ANY_CHAR_TP

