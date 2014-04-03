note
	description: "Summary description for {EL_ELEMENT_ATTRIBUTE_TABLE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-02-24 18:24:11 GMT (Monday 24th February 2014)"
	revision: "4"

class
	EL_ELEMENT_ATTRIBUTE_TABLE

inherit
	EL_VTD_XML_ATTRIBUTE_API

	EL_MEMORY
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialization

	make (element_context: EL_XPATH_NODE_CONTEXT)
			--
		do
			c_node_context := element_context.self_ptr
			exception_callbacks_c_struct := element_context.exception_callbacks_c_struct
		end

feature -- Access

	item alias "[]", string (name: STRING_32): EL_ASTRING
			-- attribute content as string
		require
			exists: has (name)
		do
			Result := wide_string (c_node_context_attribute_string (name))
		end

	string_32 (name: STRING_32): STRING_32
			-- attribute content as wide string
		require
			exists: has (name)
		do
			Result := wide_string (c_node_context_attribute_string (name))
		end

	raw_string (name: STRING_32): EL_ASTRING
			--  attribute content as string with entities and char references not expanded
		require
			exists: has (name)
		do
			Result := wide_string (c_node_context_attribute_raw_string (name))
		end

	raw_string_32 (name: STRING_32): STRING_32
			-- attribute content as wide string with entities and char references not expanded
		require
			exists: has (name)
		do
			Result := wide_string (c_node_context_attribute_raw_string (name))
		end

	integer (name: STRING_32): INTEGER
			-- attribute content as an INTEGER
		require
			exists: has (name)
			is_integer: item (name).is_integer
		do
			Result := c_node_context_attribute_integer (name)
		end

	integer_64 (name: STRING_32): INTEGER_64
			-- attribute content as an INTEGER_64
		require
			exists: has (name)
			is_integer_64: item (name).is_integer_64
		do
			Result := c_node_context_attribute_integer_64 (name)
		end

	natural (name: STRING_32): NATURAL
			-- attribute content as a NATURAL
		require
			exists: has (name)
			is_natural: item (name).is_natural
		do
			Result := item (name).to_natural
		end

	natural_64 (name: STRING_32): NATURAL_64
			-- attribute content as a NATURAL_64
		require
			exists: has (name)
			is_natural_64: item (name).is_natural_64
		do
			Result := item (name).to_natural_64
		end

	real (name: STRING_32): REAL
			-- attribute content as a REAL
		require
			exists: has (name)
			is_real: item (name).is_real
		do
			Result := c_node_context_attribute_real (name)
		end

	double (name: STRING_32): DOUBLE
			-- attribute content as a DOUBLE
		require
			exists: has (name)
			is_double: item (name).is_double
		do
			Result := c_node_context_attribute_double (name)
		end

	boolean (name: STRING_32): BOOLEAN
			-- attribute content as a BOOLEAN
		require
			exists: has (name)
			is_boolean: item (name).is_boolean
		do
			Result := item (name).to_boolean
		end

feature -- Status query

	has (name: STRING_32): BOOLEAN
			--
		do
			Result := is_attached (c_node_context_attribute_string (name))
		end

end
