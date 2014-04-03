note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-04 9:54:45 GMT (Saturday 4th January 2014)"
	revision: "4"

deferred class
	EVOLICITY_SERIALIZEABLE_AS_XML

inherit
	EVOLICITY_SERIALIZEABLE
		rename
			serialized_text as to_xml,
			serialize_to_file as save_as_xml
		export
			{ANY} Template
		redefine
			new_getter_functions, stored_successfully, utf8_encoded
		end

	EL_SERIALIZEABLE_AS_XML

feature -- Access

	Root_element_name: STRING
			--
		require
			xml_template_ends_with_tag: Template.item (Template.count) = '>'
		local
			pos_last_left_bracket: INTEGER
		do
			pos_last_left_bracket := Template.last_index_of ('<', Template.count)
			Result := Template.substring (pos_last_left_bracket + 2, Template.count - 1).to_string_8
		end

	encoding_name: STRING
		do
			Result := Default_encoding_name
		end

feature -- Status query

	utf8_encoded: BOOLEAN
		do
			Result := encoding_name.same_string ("UTF-8")
		end

feature {NONE} -- Implementation

	stored_successfully (a_file: like new_open_read_file): BOOLEAN
		require else
			xml_template_ends_with_tag: Template.item (Template.count) = '>'
		local
			closing_tag: STRING
		do
			closing_tag := "</" + Root_element_name + ">"
			a_file.go (a_file.count - closing_tag.count)
			a_file.read_line
			Result := closing_tag ~ a_file.last_string
		end

	new_getter_functions: like getter_functions
			--
		do
			Result := Precursor
			Result [Variable_to_xml] :=  agent to_xml
			Result [Variable_encoding_name] := agent encoding_name
		end

feature {NONE} -- Constants

	Variable_to_xml: EL_ASTRING
		once
			Result := "to_xml"
		end

	Variable_encoding_name: EL_ASTRING
		once
			Result := "encoding_name"
		end

	Default_encoding_name: STRING
		once
			Result := "ISO-8859-1"
		end

end
