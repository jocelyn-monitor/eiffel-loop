note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-04 9:59:39 GMT (Saturday 4th January 2014)"
	revision: "2"

class
	WEB_FORM_TEXT

inherit
	WEB_FORM_COMPONENT
		rename
			make as make_component
		end

	EVOLICITY_SERIALIZEABLE_TEXT_VALUE
		rename
			make as make_serializeable
		undefine
			new_getter_functions, make_serializeable
		end

create
	make

feature {NONE} -- Initialization

	make (s: STRING)
			--
		do
			make_component
			text := s
		end

feature {NONE} -- Implementation

	building_action_table: like Type_building_actions
			--
		do
			create Result
		end

end
