note
	description: "Summary description for {ID3_EDIT_CONSTANTS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-07 19:08:15 GMT (Thursday 7th November 2013)"
	revision: "4"

class
	ID3_EDIT_CONSTANTS

feature {NONE} -- Constants

	ID3_frame_c0: EL_ASTRING
			-- Rhythmbox standard comment description
		once
			Result := "c0"
		end

	ID3_frame_comment: EL_ASTRING
			-- Rhythmbox non-standard comment description
		once
			Result := "Comment"
		end

	ID3_frame_performers: EL_ASTRING
		once
			Result := "Performers"
		end

	Comment_fields: ARRAY [EL_ASTRING]
		once
			Result := << Field_artists, Field_singers >>
			Result.compare_objects
		end

	Field_artists: EL_ASTRING
		once
			Result := "Artists"
		end

	Field_singers: EL_ASTRING
		once
			Result := "Singers"
		end

end
