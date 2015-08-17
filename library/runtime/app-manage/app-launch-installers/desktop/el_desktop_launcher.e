note
	description: "Desktop item for launching application"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:27 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	EL_DESKTOP_LAUNCHER

inherit
	EL_DESKTOP_MENU_ITEM
		redefine
			make
		end

	EL_MODULE_STRING

create
	make

feature {NONE} -- Initialization

	make (a_name, a_comment: like name; a_icon_path: EL_FILE_PATH)
			--
		do
			Precursor (a_name, a_comment, a_icon_path)
			create command.make_empty
		end

feature -- Element change

	set_command (a_command: like command)
			--
		do
			command := a_command
		end

	set_command_args (a_command_args: like command_args)
			--
		do
			command_args := a_command_args
			command_args.replace_character ('%N', ' ')
		end

feature -- Access

	command: ASTRING

	command_args: ASTRING

end
