note
	description: "Summary description for {EL_PYXIS_STRING_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-10-25 9:37:36 GMT (Friday 25th October 2013)"
	revision: "3"

deferred class
	EL_PYXIS_STRING_LIST

inherit
	EL_BUILDABLE_FROM_PYXIS
		redefine
			building_action_table
		end

feature -- Element change

	extend (str: EL_ASTRING)
		deferred
		end

feature {NONE} -- Build from XML

	building_action_table: like Type_building_actions
			--
		do
			create Result.make (<<
				[item_xpath, agent do extend (node.to_string) end]
			>>)
		end

	item_xpath: STRING
		do
			Result := "item/text()"
		end

end
