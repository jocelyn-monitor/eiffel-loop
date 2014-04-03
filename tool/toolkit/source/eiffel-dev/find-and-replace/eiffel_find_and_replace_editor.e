note
	description: "Summary description for {EIFFEL_FIND_AND_REPLACE_SOURCE_EDITOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-02-21 9:47:34 GMT (Friday 21st February 2014)"
	revision: "2"

class
	EIFFEL_FIND_AND_REPLACE_EDITOR

inherit
	EIFFEL_SOURCE_EDITING_PROCESSOR
		rename
			make as make_editor
		end

create
	make

feature {NONE} -- Initialization

	make (a_find_text: like find_text; a_replacement_text: like replacement_text)
			--
		do
			find_text := a_find_text
			replacement_text := a_replacement_text
			make_editor
		end

feature {NONE} -- Pattern definitions

	search_patterns: ARRAYED_LIST [EL_TEXTUAL_PATTERN]
		do
			create Result.make_from_array (<< string_literal (find_text) |to| agent replace (?, replacement_text)>>)
		end

feature {NONE} -- Implementation

	find_text: STRING

	replacement_text: STRING
end
