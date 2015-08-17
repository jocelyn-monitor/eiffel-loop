﻿note
	description: "Summary description for {EL_ENCRYPTABLE_XML_RECORD_OPERATION_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-01-01 14:27:22 GMT (Thursday 1st January 2015)"
	revision: "4"

class
	EL_ENCRYPTABLE_XML_ELEMENT_LIST_EDITIONS [STORABLE_TYPE -> {EL_ENCRYPTABLE, EL_STORABLE_XML_ELEMENT} create make_empty end]

inherit
	EL_XML_ELEMENT_LIST_EDITIONS [STORABLE_TYPE]
		rename
			make as make_editions
		redefine
			prepare_element, store_edition,  apply_edition
		end

	EL_ENCRYPTABLE
		rename
			encrypter as main_encrypter
		end

create
	make

feature {NONE} -- Initialization

	make (a_target_list: like target_list; a_file_path: EL_FILE_PATH; a_encrypter: like main_encrypter)
			--
		do
			main_encrypter := a_encrypter
			make_editions (a_target_list, a_file_path)
		end

feature {NONE} -- Implementation

	apply_edition (edition: like Type_edition)
			--
		do
			Precursor (edition)
			if edition.has_element then
				edition.element.set_encrypter (main_encrypter)
			end
		end

	store_edition (edition: like Type_edition)
			--
		do
			if edition.has_element then
				edition.element.set_encrypter (create {EL_AES_ENCRYPTER}.make_from_key (main_encrypter.key_data))
			end
			Precursor (edition)
			if edition.has_element then
				edition.element.set_encrypter (main_encrypter)
			end
		end

	prepare_element (element: STORABLE_TYPE)
			--
		do
			element.set_encrypter (create {EL_AES_ENCRYPTER}.make_from_key (main_encrypter.key_data))
		end

end
