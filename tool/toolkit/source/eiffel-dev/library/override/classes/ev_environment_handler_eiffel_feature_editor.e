﻿note
	description: "Summary description for {EV_ENVIRONMENT_HANDLER_FEATURE_EDITOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-16 11:10:41 GMT (Monday 16th March 2015)"
	revision: "6"

class
	EV_ENVIRONMENT_HANDLER_EIFFEL_FEATURE_EDITOR

inherit
	EIFFEL_OVERRIDE_FEATURE_EDITOR

create
	make

feature {NONE} -- Implementation

	new_feature_edit_actions: like feature_edit_actions
		do
			create Result.make (<<
				["make", agent change_type_of_implementation_object]
			>>)
		end

	change_type_of_implementation_object (class_feature: CLASS_FEATURE)
		do
			class_feature.search_substring ("application_i.make")
			if class_feature.found then
				class_feature.found_line.replace_substring_all ("{EV_", "{EL_")
				class_feature.lines.append_comment ("changed type")
			end
		end
end
