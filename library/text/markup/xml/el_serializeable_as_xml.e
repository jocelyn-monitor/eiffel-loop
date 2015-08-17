note
	description: "Summary description for {EL_SERIALIZEABLE_AS_XML}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:29 GMT (Wednesday 11th March 2015)"
	revision: "2"

deferred class
	EL_SERIALIZEABLE_AS_XML

feature -- Conversion

	to_xml: ASTRING
			--
		deferred
		end

	to_utf_8_xml: STRING
			--
		deferred
		end

end
