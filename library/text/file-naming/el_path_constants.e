note
	description: "Summary description for {EL_PATH_CONSTANTS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:28 GMT (Wednesday 11th March 2015)"
	revision: "7"

class
	EL_PATH_CONSTANTS

feature -- Constants

	Invalid_NTFS_characters: ASTRING
		-- path characters that are invalid for a Windows NT file system
		once
			Result := Invalid_NTFS_characters_32
		end

	Invalid_NTFS_characters_32: STRING_32 = "/?<>\:*|%""

end
