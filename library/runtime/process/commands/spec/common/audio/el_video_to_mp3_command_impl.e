note
	description: "Summary description for {EL_MP3_CLIP_SAVER_COMMAND_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-01-04 13:29:07 GMT (Sunday 4th January 2015)"
	revision: "4"

class
	EL_VIDEO_TO_MP3_COMMAND_IMPL

inherit
	EL_WAV_TO_MP3_IMPL
		undefine
			template
		end

	EL_VIDEO_CONVERSION_COMMAND_IMPL

feature -- Access

	Command_arguments: STRING = "[
		-v quiet -i "$input_file_path"
		#if $has_offset_time then
			-ss $offset_time
		#end
		#if $has_duration then
			-t ${duration}
		#end
		-f wav - | lame --silent --id3v2-only --tt "Title" -h -b ${bit_rate}
		- "$output_file_path"
	]"

	-- Piping of wav output is used instead of -acode libmp3lame to prevent a problem of incorrect durations
	-- being reported in some media players (Neutron MP)

	-- A ID3 2.3 title is added to ensure a skelton ID3 header is in place.

end
