note
	description: "Summary description for {EL_CPU_INFO_COMMAND_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-24 10:54:38 GMT (Wednesday 24th June 2015)"
	revision: "4"

class
	EL_AUDIO_PROPERTIES_COMMAND_IMPL

inherit
	EL_VIDEO_CONVERSION_COMMAND_IMPL

create
	make

feature -- Access

	Command_arguments: STRING = "[
		-i "$file_path"
	]"

end
