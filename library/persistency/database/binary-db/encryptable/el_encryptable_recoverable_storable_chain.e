note
	description: "Summary description for {EL_ENCRYPTABLE_RECOVERABLE_STORABLE_CHAIN}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-04 9:49:08 GMT (Saturday 4th January 2014)"
	revision: "3"

deferred class
	EL_ENCRYPTABLE_RECOVERABLE_STORABLE_CHAIN [G -> EL_MEMORY_READ_WRITEABLE]

inherit
	EL_ENCRYPTABLE_STORABLE_CHAIN [G]
		undefine
			make_from_file
		end

	EL_RECOVERABLE_STORABLE_CHAIN [G]
		undefine
			is_encrypted, new_reader_writer, store_as, retrieve, rename_file
		redefine
			Type_editions_file
		end

feature {NONE} -- Type definitions

	Type_editions_file: EL_ENCRYPTABLE_EDITIONS_FILE [G]
		do
		end

end
