﻿note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:33:26 GMT (Thursday 11th December 2014)"
	revision: "3"

deferred class
	EL_XML_NODE_VISITOR

feature {EL_XML_NODE_VISITOR_DRIVER} -- Parsing events

	on_start_document
			--
		deferred
		end

	on_end_document
			--
		deferred
		end

	on_start_tag (node: EL_XML_NODE; attribute_list: EL_XML_ATTRIBUTE_LIST)
			--
		deferred
		end

	on_end_tag (node: EL_XML_NODE)
			--
		deferred
		end

	on_content (node: EL_XML_NODE)
			--
		deferred
		end

	on_comment (node: EL_XML_NODE)
			--
		deferred
		end

end
