note
	description: "Summary description for {EL_XML_ELEMENT}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-02 11:58:47 GMT (Tuesday 2nd June 2015)"
	revision: "2"

deferred class
	EL_XML_ELEMENT

inherit
	EL_MODULE_XML

	EL_STRING_CONSTANTS

feature -- Access

	name: ASTRING
		deferred
		end

feature -- Basic operations

	write (medium: EL_OUTPUT_MEDIUM)
		deferred
		end

end
