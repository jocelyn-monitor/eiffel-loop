note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:44 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	WEB_FORM_LINE_BREAK

inherit
	WEB_FORM_COMPONENT

create
	make

feature {NONE} -- Implementation

	building_action_table: like Type_building_actions
			--
		do
			create Result
		end

	getter_function_table: like getter_functions
			--
		do
			create Result
		end

	Template: STRING = "<br/>"

end
