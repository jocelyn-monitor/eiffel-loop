﻿note
	description: "Summary description for {EIFFEL_FIND_AND_REPLACE_SOURCE_EDITOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-01-01 12:45:38 GMT (Thursday 1st January 2015)"
	revision: "4"

class
	EIFFEL_FIND_AND_REPLACE_EDITOR

inherit
	EIFFEL_SOURCE_EDITING_PROCESSOR

create
	make

feature {NONE} -- Initialization

	make (a_find_text: like find_text; a_replacement_text: like replacement_text)
			--
		do
			find_text := a_find_text
			replacement_text := a_replacement_text
			make_default
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
