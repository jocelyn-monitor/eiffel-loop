note
	description: "Summary description for {EVOLICITY_INTEGER_64_COMPARABLE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "2"

class
	EVOLICITY_INTEGER_64_COMPARABLE

inherit
	EVOLICITY_COMPARABLE

create
	make_from_string

feature {NONE} -- Initialization

	make_from_string (string: STRING)
			--
		require
			valid_string: string.is_integer_64
		do
			item := string.to_integer_64.to_reference
		end

end
