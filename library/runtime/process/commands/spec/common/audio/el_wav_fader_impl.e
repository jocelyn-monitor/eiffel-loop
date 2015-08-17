note
	description: "Summary description for {EL_WAV_FADER_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-24 10:54:53 GMT (Wednesday 24th June 2015)"
	revision: "4"

class
	EL_WAV_FADER_IMPL

inherit
	EL_COMMAND_IMPL

create
	make

feature -- Access

	Template: STRING = "[
		sox -V1 "$input_file_path" "$output_file_path" fade t $fade_in $duration $fade_out
	]"

end
