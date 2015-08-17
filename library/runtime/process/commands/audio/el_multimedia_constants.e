note
	description: "Summary description for {EL_MULTIMEDIA_CONSTANTS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 14:04:37 GMT (Wednesday 11th March 2015)"
	revision: "4"

class
	EL_MULTIMEDIA_CONSTANTS

feature -- Constants

	File_extension_wav: ASTRING
		once
			Result := "wav"
		end

	File_extension_mp3: ASTRING
		once
			Result := "mp3"
		end

end
