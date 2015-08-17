﻿note
	description: "Summary description for {EL_DEFAULT_SERIALIZEABLE_XML}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:28 GMT (Wednesday 11th March 2015)"
	revision: "4"

class
	EL_DEFAULT_SERIALIZEABLE_XML

inherit
	EL_SERIALIZEABLE_AS_XML

feature -- Conversion

	to_xml: ASTRING
			--
		do
			Result := Default_xml
		end

	to_utf_8_xml: STRING
			--
		do
			Result := Default_xml
		end

feature {NONE} -- Constants

	Default_xml: STRING =
		--
	"[
		<?xml version="1.0" encoding="UTF-8"?>
		<default/>
	]"

end
