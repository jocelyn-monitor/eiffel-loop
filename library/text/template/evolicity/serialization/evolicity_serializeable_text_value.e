note
	description: "Summary description for {EVOLICITY_SERIALIZEABLE_TEXT_VALUE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 14:05:29 GMT (Wednesday 11th March 2015)"
	revision: "3"

class
	EVOLICITY_SERIALIZEABLE_TEXT_VALUE

inherit
	EVOLICITY_SERIALIZEABLE_AS_XML

feature -- Access

	text: ASTRING

feature {NONE} -- Evolicity reflection

	Template: STRING_32 = "$text"

	getter_function_table: like getter_functions
			--
		do
			create Result.make (<<
				["text", agent: ASTRING do Result := text end]
			>>)
		end

end
