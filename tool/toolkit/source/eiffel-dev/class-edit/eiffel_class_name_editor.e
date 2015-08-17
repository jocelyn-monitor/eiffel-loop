﻿note
	description: "Summary description for {EIFFEL_CLASS_NAME_EDITOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:47:23 GMT (Wednesday 11th March 2015)"
	revision: "6"

class
	EIFFEL_CLASS_NAME_EDITOR

inherit
	EIFFEL_SOURCE_EDITING_PROCESSOR
		redefine
			reset
		end

feature {NONE} -- Initialization

	make
			--
		do
			create class_name.make_empty
			make_default
		end

feature {NONE} -- Pattern definitions

	search_patterns: ARRAYED_LIST [EL_TEXTUAL_PATTERN]
		do
			create Result.make_from_array (<<
				all_of (<<
					all_of (<< white_space, string_literal ("class"), white_space >>) |to| agent on_unmatched_text,
					class_identifier |to| agent on_class_name
				>>),
				class_identifier |to| agent on_class_reference
			>>)
		end

feature {NONE} -- Implementation

	reset
		do
			Precursor
			class_name.wipe_out
		end

	set_class_name (a_class_name: like class_name)
		require
			class_name_not_empty: not a_class_name.is_empty
		local
			class_file_name: ASTRING
		do
			class_name := a_class_name.string
			class_file_name := class_name.as_lower + ".e"
			if output_file_path.base /~ class_file_name then
				check attached {FILE} output as output_file then
					output_file.rename_file (output_file_path.parent + class_file_name)
					log_or_io.put_line ("  * * File renamed! * * ")
				end
			end
		end

	class_name: STRING

feature {NONE} -- Events

	on_class_name (text: EL_STRING_VIEW)
			--
		do
			if class_name.is_empty then
				class_name := text
			end
			put_string (text)
		end

	on_class_reference (text: EL_STRING_VIEW)
			--
		do
			put_string (text)
		end

end
