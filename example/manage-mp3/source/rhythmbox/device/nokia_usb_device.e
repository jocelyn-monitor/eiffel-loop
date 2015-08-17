note
	description: "Nokia have their own Windows style playlist format"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-01-14 16:39:30 GMT (Wednesday 14th January 2015)"
	revision: "4"

class
	NOKIA_USB_DEVICE

inherit
	USB_DEVICE
		redefine
			new_m3u_playlist
		end

create
	make

feature {NONE} -- Factory

	new_m3u_playlist (playlist: RBOX_PLAYLIST; output_path: EL_FILE_PATH): NOKIA_PLAYLIST
		do
			create Result.make (playlist.m3u_list, playlist_root, output_path)
		end

end
