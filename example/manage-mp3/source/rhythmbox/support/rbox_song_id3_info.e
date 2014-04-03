note
	description: "Summary description for {RBOX_SONG_ID3_INFO}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-15 17:46:45 GMT (Friday 15th November 2013)"
	revision: "5"

class
	RBOX_SONG_ID3_INFO

inherit
	EL_ID3_INFO
		rename
			make_version_23 as make_version_23_from_other
		end


create
	make

feature {NONE} -- Initialization

	make_version_23 (song: RBOX_SONG)
		do

		end

end
