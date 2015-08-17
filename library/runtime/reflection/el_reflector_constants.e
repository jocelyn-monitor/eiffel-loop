note
	description: "Summary description for {EL_REFLECTOR_CONSTANTS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-15 9:04:25 GMT (Friday 15th May 2015)"
	revision: "4"

class
	EL_REFLECTOR_CONSTANTS

inherit
	REFLECTOR_CONSTANTS
		export
			{NONE} all
		end

feature {NONE} -- Constants

	Astring_type: INTEGER
		once
			Result := ({ASTRING}).type_id
		end

	String_8_type: INTEGER
		once
			Result := ({STRING}).type_id
		end

	String_32_type: INTEGER
		once
			Result := ({STRING_32}).type_id
		end

	Once_current_object: REFLECTED_REFERENCE_OBJECT
		once
			create Result.make (Current)
		end
end
