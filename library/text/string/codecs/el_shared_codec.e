note
	description: "Summary description for {EL_SHARED_CODEC}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-08-02 20:23:17 GMT (Friday 2nd August 2013)"
	revision: "4"

class
	EL_SHARED_CODEC

inherit
	EL_SHARED_CELL [EL_CODEC]
		rename
			item as codec,
			set_item as set_codec,
			cell as Codec_cell
		end

feature {NONE} -- Implementation

	Codec_cell: CELL [EL_CODEC]
		once
			create Result.put (create {EL_ISO_8859_15_CODEC}.make)
		end

end
