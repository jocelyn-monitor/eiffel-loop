note
	description: "Summary description for {EV_INTERNALLY_PROCESSED_TEXTABLE_IMP_EIFFEL_FEATURE_EDITOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-16 11:11:56 GMT (Monday 16th March 2015)"
	revision: "6"

class
	EV_INTERNALLY_PROCESSED_TEXTABLE_IMP_EIFFEL_FEATURE_EDITOR

inherit
	EIFFEL_OVERRIDE_FEATURE_EDITOR

create
	make

feature {NONE} -- Implementation

	new_feature_edit_actions: like feature_edit_actions
		do
			create Result.make (<<
				["escaped_text", agent fix_contract_expression]
			>>)
		end

	fix_contract_expression (class_feature: CLASS_FEATURE)
		do
			class_feature.search_substring ("ampersand_occurrences_doubled")
			if class_feature.found then
				class_feature.found_line.replace_substring_all (": s.as_string_32", ": Result.as_string_32")
				class_feature.lines.append_comment ("fix")
			end
		end
end
