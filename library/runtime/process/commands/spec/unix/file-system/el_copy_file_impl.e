note
	description: "Summary description for {EL_COPY_FILE_IMPL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2013 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-06-18 10:28:42 GMT (Tuesday 18th June 2013)"
	revision: "2"

class
	EL_COPY_FILE_IMPL

inherit
	EL_COMMAND_IMPL

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
