﻿note
	description: "Summary description for {EIFFEL_CLASS_FILE_NAME_NORMALIZER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:36 GMT (Thursday 11th December 2014)"
	revision: "4"

class
	EIFFEL_CLASS_FILE_NAME_NORMALIZER

inherit
	EIFFEL_CLASS_NAME_EDITOR
		redefine
			on_class_name
		end

create
	make

feature {NONE} -- Events

	on_class_name (text: EL_STRING_VIEW)
			--
		local
			name: STRING
		do
			name := text
			if class_name.is_empty then
				set_class_name (name)
			end
			put_string (name)
		end

end
