﻿note
	description: "Summary description for {WEB_PAGE_PROPERTIES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:47:42 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	WEB_PAGE_PROPERTIES

inherit
	EL_XPATH_ROOT_NODE_CONTEXT
		redefine
			make_from_file
		end

	EL_PLAIN_TEXT_LINE_STATE_MACHINE
		rename
			make as make_machine
		undefine
			default_create
		end

create
	make_from_file

feature {NONE} -- Initaliazation

	make_from_file (file_path: EL_FILE_PATH)
			--
		do
			log.enter_with_args ("make_from_file", << file_path >>)
			make_machine
			create lines.make_empty
			do_once_with_file_lines (agent find_html_tag, create {EL_FILE_LINE_SOURCE}.make (file_path))
			lines.extend ("</html>")
			log.put_string_field_to_max_length ("XML", lines.joined_lines, 200)
			log.put_new_line
			make_from_string (lines.joined_lines)
			lines.wipe_out
			log.exit
		end

feature {NONE} -- Line procedure transitions

	find_html_tag (line: ASTRING)
			--
		do
			if line.starts_with ("<html>") then
				lines.extend (line)
				state := agent find_body_tag
			end
		end

	find_body_tag (line: ASTRING)
			--
		do
			line.left_adjust
			lines.extend (line)
			if line.starts_with ("<meta") then
				line.insert_character ('/', line.count)

			elseif line.starts_with ("<body") then
				state := agent find_end_of_body_attributes
				find_end_of_body_attributes (line)
			end
		end

	find_end_of_body_attributes (line: ASTRING)
			--
		do
			if lines.last /= line then
				lines.extend (line)
			end
			if line.ends_with (">") then
				line.insert_character ('/', line.count)
				state := agent final
			end
		end

feature {NONE} -- Implementation

	lines: EL_LINKED_STRING_LIST [ASTRING]
		-- Header lines

end
