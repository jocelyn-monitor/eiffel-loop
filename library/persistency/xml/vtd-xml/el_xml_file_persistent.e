﻿note
	description: "Summary description for {EL_XML_FILE_PERSISTENT}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:33:26 GMT (Thursday 11th December 2014)"
	revision: "6"

deferred class
	EL_XML_FILE_PERSISTENT

inherit
	EVOLICITY_SERIALIZEABLE_AS_XML
		rename
			save_as_xml as store_as
		export
			{EL_XML_FILE_PERSISTENT} template_path
		redefine
			make_from_file, file_must_exist
		end

	EL_FILE_PERSISTENT
		rename
			file_path as output_path,
			set_file_path as set_output_path
		undefine
			make_from_file
		end

feature {NONE} -- Initialization

	make_from_file (a_file_path: EL_FILE_PATH)
			--
		local
			root_node: EL_XPATH_ROOT_NODE_CONTEXT
		do
			Precursor {EVOLICITY_SERIALIZEABLE_AS_XML} (a_file_path)
			create root_node.make_from_file (a_file_path)
			set_encoding_from_name (root_node.encoding_name)
			make_from_root_node (root_node)
		end

	make_from_other (other: like Current)
		local
			root_node: EL_XPATH_ROOT_NODE_CONTEXT
		do
			make_from_template_and_output (other.template_path.twin, other.output_path.twin)
			create root_node.make_from_string (other.to_xml)
			set_encoding_from_name (root_node.encoding_name)
			make_from_root_node (root_node)
		end

	make_from_root_node (root_node: EL_XPATH_ROOT_NODE_CONTEXT)
		deferred
		end

feature {NONE} -- Implementation

	file_must_exist: BOOLEAN
			-- True if output file exists after creation
		do
			Result := True
		end

end
