﻿note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	JAVA_PROCEDURE [BASE_TYPE -> JAVA_OBJECT_REFERENCE]

inherit
	JAVA_ROUTINE [BASE_TYPE]

create
	make

feature -- Basic operations

	call (target: BASE_TYPE; args: TUPLE)
			--
		require
			valid_operands: valid_operands (args)
			valid_target: valid_target (target)
		do
			java_args.put_java_tuple (args)
			target.void_method (method_id , java_args)
		end

feature {NONE} -- Implementation

	return_type_signature: STRING = "V"
			-- Routines return type void

end -- class JAVA_PROCEDURE
