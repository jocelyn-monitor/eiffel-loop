﻿note
	description: "Summary description for {EL_RSA_KEY}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:33:27 GMT (Thursday 11th December 2014)"
	revision: "3"

deferred class
	EL_STORABLE_RSA_KEY

inherit
	EL_MODULE_RSA

feature {NONE} -- Implementation

	rsa_value (root_node: EL_XPATH_ROOT_NODE_CONTEXT; id: STRING): INTEGER_X
			--
		do
			if not id.is_empty then
				Value_xpath.set_variable ("id", id)
			end
			Result := Rsa.integer_x_from_base64 (root_node.string_at_xpath (Value_xpath.substituted))
		end

	value_xpath: EL_SUBSTITUTION_TEMPLATE [STRING]
			--
		deferred
		end

end
