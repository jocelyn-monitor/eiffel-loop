note
	description: "Summary description for {EL_COPY_FILE_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-24 10:36:49 GMT (Wednesday 24th June 2015)"
	revision: "3"

class
	EL_COPY_FILE_IMPL

inherit
	EL_COMMAND_IMPL

create
	make

feature -- Access

	template: STRING = "[
		cp
		#if $is_recursive then
			--recursive
		#end
		#if $is_timestamp_preserved then
			--preserve=timestamps
		#end
		#if $is_destination_a_normal_file then
			--no-target-directory
		#end 
	 	"$source_path" "$destination_path"
	]"

end
