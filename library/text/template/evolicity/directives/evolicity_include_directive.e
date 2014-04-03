note
	description: "Summary description for {EVOLICITY_INCLUDE_DIRECTIVE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-24 16:02:17 GMT (Sunday 24th November 2013)"
	revision: "4"

class
	EVOLICITY_INCLUDE_DIRECTIVE

inherit
	EVOLICITY_NESTED_TEMPLATE_DIRECTIVE

	EL_MODULE_FILE_SYSTEM
		undefine
			is_equal, copy
		end

create
	make

feature -- Basic operations

	execute (context: EVOLICITY_CONTEXT; output: IO_MEDIUM; utf8_encoded: BOOLEAN)
			--
		local
			included_text: EL_ASTRING
		do
			if attached {EL_ASTRING} context.referenced_item (variable_ref) as file_path then
				if utf8_encoded then
					create included_text.make_from_utf8 (File_system.plain_text (file_path))
				else
					create included_text.make_from_string (File_system.plain_text (file_path))
				end
				if Evolicity_engine.is_nested_output_indented then
					put_indented_string (output, included_text, utf8_encoded)
				else
					output.put_string (included_text)
				end
			end
		end

end
