note
	description: "Summary description for {EL_ENCRYPTABLE_BINARY_EDITIONS_FILE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-06 16:11:32 GMT (Wednesday 6th May 2015)"
	revision: "4"

class
	EL_ENCRYPTABLE_CHAIN_EDITIONS_FILE [G -> EL_STORABLE create make_default end]

inherit
	EL_CHAIN_EDITIONS_FILE [G]
		redefine
			put_header, read_header, skip_header, apply
		end

create
	make

feature {EL_STORABLE_CHAIN_EDITIONS} -- Basic operations

	apply
		do
			encrypter.reset
			Precursor
		end

feature {NONE} -- Implementation

	encrypter: EL_AES_ENCRYPTER
		do
			Result := item_chain.encrypter
		end

	put_header
		do
			Precursor
			encrypter.save_encryption_state (Current)
		end

	read_header
		do
			Precursor
			encrypter.restore_encryption_state (Current)
		end

	skip_header
		do
			Precursor
			move (encrypter.Block_size)
		end

end
