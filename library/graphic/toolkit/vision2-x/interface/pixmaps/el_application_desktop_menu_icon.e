note
	description: "Summary description for {EL_DESKTOP_MENU_PIXMAPS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-01-12 14:40:32 GMT (Sunday 12th January 2014)"
	revision: "3"

class
	EL_APPLICATION_DESKTOP_MENU_ICON

inherit
	EL_APPLICATION_PIXMAP

feature -- Access

	image_path (relative_path_steps: EL_PATH_STEPS): EL_FILE_PATH
		do
			Result := Mod_image_path.desktop_menu_icon (relative_path_steps)
		end

end
