﻿note
	description: "Queries an XPath context node for file specifiers"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:47:31 GMT (Wednesday 11th March 2015)"
	revision: "6"

deferred class
	FILE_SPECIFIER_LIST

inherit
	EL_MODULE_LOG

feature {NONE} -- Implementation

	write_specifiers (directory_node: EL_XPATH_NODE_CONTEXT)
			--
		require
			-- Query has form AAA/BBB
			-- Eg. filter/exclude
			valid_query_path: query_path.split ('/').count = 2
		local
			specifier_name, file_specifier: ASTRING
		do
			log.enter ("write_specifiers")
			across directory_node.context_list (query_path) as specifier loop
				specifier_name := specifier.node.name
				file_specifier := specifier.node.normalized_string_value
				log_or_io.put_string_field (specifier_name.as_proper_case, file_specifier)
				log_or_io.put_new_line
				put_file_specifier (specifier_name, file_specifier)
			end
			log.exit
		end

	put_file_specifier (specifier_name, file_specifier: ASTRING)
			--
		deferred
		end

	query_path: STRING_32
			-- Query has form AAA/BBB
			-- Eg. filter/exclude
		deferred
		end

end
