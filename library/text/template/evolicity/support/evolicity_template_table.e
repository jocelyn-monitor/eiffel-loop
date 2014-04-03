note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-23 15:17:06 GMT (Saturday 23rd November 2013)"
	revision: "3"

class
	EVOLICITY_TEMPLATE_TABLE

inherit
	HASH_TABLE [EVOLICITY_COMPILED_TEMPLATE, EL_FILE_PATH]
		redefine
			default_create
		end

create
	default_create

feature {NONE} -- Initialization

	default_create
			--
		do
			make (19)
			compare_objects
		end

end
