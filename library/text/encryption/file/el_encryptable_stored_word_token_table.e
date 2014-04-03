note
	description: "Summary description for {ENCRYPTABLE_FILED_WORD_TOKEN_TABLE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-03-16 9:56:40 GMT (Sunday 16th March 2014)"
	revision: "4"

class
	EL_ENCRYPTABLE_STORED_WORD_TOKEN_TABLE

inherit
	EL_STORED_WORD_TOKEN_TABLE
		redefine
			make_empty, open_word_file, Type_text_file
		end

	EL_ENCRYPTABLE
		undefine
			is_equal, copy
		end

create
	make_empty, make_from_file_and_encryption_key

feature {NONE} -- Initialization

	make_from_file_and_encryption_key (a_file_path: EL_FILE_PATH; key_data: ARRAY [NATURAL_8])
		do
			log.enter ("make_from_file_and_encryption_key")
			create encrypter.make_from_key (key_data)
			make_from_file (a_file_path)

			if log.current_routine_is_active and then not words.is_empty then
				from words.go_i_th (words.count - 5) until words.after loop
					log.put_string_field (words.index.out, words.item); log.put_new_line
					words.forth
				end
			end
			log.exit
		end

	make_empty
		do
			Precursor
			create encrypter
		end

feature {NONE} -- Implementation

	open_word_file (a_file_path: EL_FILE_PATH; a_mode: INTEGER): like Type_text_file
		do
			Result := Precursor (a_file_path, a_mode)
			Result.set_encrypter (encrypter)
			Result.set_encrypter_synchronization
		end

feature {NONE} -- Type definitions

	Type_text_file: EL_ENCRYPTABLE_NOTIFYING_PLAIN_TEXT_FILE
		do
		end

end
