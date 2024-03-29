﻿note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	EL_LITERAL_CHAR_TP

inherit
	EL_SINGLE_CHAR_TEXTUAL_PATTERN

create
	make_from_character, make, make_with_action

feature {NONE} -- Initialization

	make_from_character (character: CHARACTER)
			--
		do
			make (character.code.to_natural_32)
		end

	make (a_code: like code)
			--
		do
			default_create
			code := a_code
		end

	make_with_action (a_code: like code; action: PROCEDURE [ANY, TUPLE [EL_STRING_VIEW]])
			--
		do
			make (a_code)
			action_on_match := action
		end

feature {NONE} -- Implementation

	actual_try_to_match
			--
		do
			if text.count > 0 then
				if text.item (1) = code then
					match_succeeded := true
					count_characters_matched := 1
				end
			end
		end

feature -- Access

	code: NATURAL_32

--	invariant valid_action_on_match: action_on_match /= Void
end -- class EL_LITERAL_CHAR_TP

