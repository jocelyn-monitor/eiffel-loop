﻿note
	description: "Summary description for {EL_ID3_TAG_I}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:36 GMT (Thursday 11th December 2014)"
	revision: "5"

deferred class
	EL_ID3_INFO_I

inherit
	EL_CPP_OBJECT
		export
			{EL_ID3_INFO} dispose
		redefine
			default_create
		end

	EL_MODULE_TAG
		undefine
			default_create
		end

feature -- Initialization

	default_create
		do
			create mp3_path
			create frame_list.make (0)
		end

	make
   		--
   	deferred
   	end

feature -- Access

	mp3_path: EL_FILE_PATH

	frame_list: ARRAYED_LIST [EL_ID3_FRAME]

feature -- Element change

	set_version (a_version: REAL)
		deferred
		end

	link_and_read (a_mp3_path: like mp3_path)
		deferred
		end

	link (a_mp3_path: like mp3_path)
		-- link file without reading tags
		deferred
		end

	detach (field: EL_ID3_FRAME)
			--
		deferred
		end

feature -- File writes

	update
			--
		deferred
		end

	update_v1
			--
		deferred
		end

	update_v2
			--
		deferred
		end

	strip_v1
			--
		deferred
		end

	strip_v2
			--
		deferred
		end

feature -- Removal

	prune (frame: EL_ID3_FRAME)
				-- Remove field frame
		do
			frame_list.prune (frame); detach (frame)
		end

	wipe_out
			--
		deferred
		end

feature -- Factory

	create_field (an_id: STRING): EL_ID3_FRAME
			--
		deferred
		end

	create_unique_file_id_field (owner_id, an_id: STRING): EL_ID3_UNIQUE_FILE_ID
			--
		deferred
		end

	create_album_picture_frame (a_picture: EL_ID3_ALBUM_PICTURE): EL_ALBUM_PICTURE_ID3_FRAME
		deferred
		end

end
