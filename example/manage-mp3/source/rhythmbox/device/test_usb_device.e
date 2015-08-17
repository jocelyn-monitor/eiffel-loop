note
	description: "Summary description for {TEST_USB_DEVICE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-28 15:48:32 GMT (Sunday 28th December 2014)"
	revision: "4"

class
	TEST_USB_DEVICE

inherit
	USB_DEVICE
		redefine
			set_volume
		end

create
	make

feature -- Element change

	set_volume (a_volume: like volume)
		do
			a_volume.set_uri_root ("./workarea/rhythmdb/TABLET")
			File_system.make_directory (a_volume.uri_root)
			Precursor (a_volume)
		end

end
