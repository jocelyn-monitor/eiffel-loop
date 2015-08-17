note
	description: "Summary description for {TO_DO_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-22 17:22:40 GMT (Friday 22nd May 2015)"
	revision: "3"

class
	TO_DO_LIST

inherit
	PROJECT_NOTES

feature -- Access

	help_info
		do
--			Add help info compilation to EL_COMMAND_LINE_SUB_APPLICATION. Add an attribute
--			help_requested: BOOLEAN
		end

	string_list_view
		do
--			Introduce the idea of a EL_STRING_LIST_VIEW to avoid concatenating file strings	
		end

	evolicity_templates
		do
--			Template indent is fine so long as blank lines have leading tabs consistent with other lines
--			Could the problem be in el_toolkit text editing which is changing the template
		end

end
