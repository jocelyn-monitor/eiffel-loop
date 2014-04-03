note
	description: "Summary description for {EL_UNDERBIT_ID3_DESCRIPTION_FIELD}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-02 15:45:48 GMT (Saturday 2nd November 2013)"
	revision: "3"

class
	EL_UNDERBIT_ID3_DESCRIPTION_FIELD

inherit
	EL_UNDERBIT_ID3_ENCODED_FIELD
		redefine
			type
		end

create
	make

feature -- Access

	type: INTEGER
		do
			Result := Type_description
		end
end
