note
	description: "Summary description for {ID3_EDIT_CONSTANTS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 14:05:54 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	ID3_EDIT_CONSTANTS

feature {NONE} -- Constants

	ID3_frame_c0: ASTRING
			-- Rhythmbox standard comment description
		once
			Result := "c0"
		end

	ID3_frame_comment: ASTRING
			-- Rhythmbox non-standard comment description
		once
			Result := "Comment"
		end

	ID3_frame_performers: ASTRING
		once
			Result := "Performers"
		end

	Comment_fields: ARRAY [ASTRING]
		once
			Result := << Field_artists, Field_singers >>
			Result.compare_objects
		end

	Field_artists: ASTRING
		once
			Result := "Artists"
		end

	Field_singers: ASTRING
		once
			Result := "Singers"
		end

end
