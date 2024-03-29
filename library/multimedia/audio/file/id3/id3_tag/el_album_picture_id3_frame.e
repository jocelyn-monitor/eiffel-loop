﻿note
	description: "Summary description for {EL_ID3_ALBUM_PICTURE_FRAME}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 14:03:28 GMT (Wednesday 11th March 2015)"
	revision: "4"

deferred class
	EL_ALBUM_PICTURE_ID3_FRAME

inherit
	EL_ID3_FRAME
		redefine
			set_description, description
		end

	EL_MODULE_FILE_SYSTEM
		undefine
			out
		end

feature {NONE} -- Initialization

	make (a_picture: EL_ID3_ALBUM_PICTURE)
			--
		do
			make_with_code (Tag.Album_picture)
			mime_type_field.set_string (a_picture.mime_type)
			image_field.set_binary_data (a_picture.data)
			set_description (a_picture.description)
		end

feature -- Access

	mime_type_field: EL_ID3_FRAME_FIELD
		do
			Result := field_list.i_th (mime_type_index)
		end

	image_field: EL_ID3_FRAME_FIELD
		do
			Result := field_list.i_th (image_index)
		end

	description: ASTRING
		do
			Result := field_list.i_th (description_index).string
		end

	picture: EL_ID3_ALBUM_PICTURE
		do
			create Result.make (image_field.binary_data, description, mime_type_field.string)
		end

feature -- Element change

	set_description (str: ASTRING)
			--
		do
			field_list.i_th (description_index).set_string (str)
		end

feature {NONE} -- Implementation

	mime_type_index: INTEGER
		deferred
		end

	image_index: INTEGER
		deferred
		end

	description_index: INTEGER
		deferred
		end

end
