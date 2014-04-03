note
	description: "Summary description for {LICENSE_INFO}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-02-21 10:52:47 GMT (Friday 21st February 2014)"
	revision: "4"

class
	LICENSE_NOTES

inherit
	EL_BUILDABLE_FROM_PYXIS
		redefine
			default_create, building_action_table
		end

	EL_MODULE_LOG
		undefine
			default_create
		end

create
	make_from_file, make_from_string

feature {NONE} -- Initialization

	default_create
			--
		do
			create author.make_empty
			create copyright.make_empty
			create contact.make_empty
			create license.make_empty
		end

feature -- Access

	author: EL_ASTRING

	copyright: EL_ASTRING

	contact: EL_ASTRING

	license: EL_ASTRING

feature {NONE} -- Build from XML

	building_action_table: like Type_building_actions
			-- Nodes relative to root element: bix
		do
			create Result.make (<<
				["@author", 	agent do author := node.to_string end],
				["@copyright", agent do copyright := node.to_string end],
				["@contact",	agent do contact := node.to_string end],
				["@license", 	agent do license := node.to_string end]
			>>)
		end

	Root_node_name: STRING = "notes"

end
