note
	description: "Summary description for {EL_XML_ESCAPING_CONSTANTS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-19 10:18:08 GMT (Friday 19th December 2014)"
	revision: "6"

class
	EL_XML_ESCAPING_CONSTANTS

feature -- Constants

	Attribute_escaper: EL_XML_ATTRIBUTE_VALUE_ESCAPER
		once
			create Result.make
		end

	Attribute_128_plus_escaper: EL_XML_ATTRIBUTE_VALUE_ESCAPER
		once
			create Result.make_128_plus
		end

	Xml_escaper: EL_XML_CHARACTER_ESCAPER
		once
			create Result.make
		end

	Xml_128_plus_escaper: EL_XML_CHARACTER_ESCAPER
		once
			create Result.make_128_plus
		end

end
