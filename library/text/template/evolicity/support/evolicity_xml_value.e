note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2012 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2012-12-16 11:34:32 GMT (Sunday 16th December 2012)"
	revision: "1"

deferred class
	EVOLICITY_XML_VALUE

inherit
	EVOLICITY_SERIALIZEABLE_AS_XML
		undefine
			to_xml
		end

feature {NONE} -- Implementation

	XML_template: STRING = ""

end
