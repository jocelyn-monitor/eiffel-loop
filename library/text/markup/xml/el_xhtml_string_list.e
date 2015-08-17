﻿note
	description: "Summary description for {EL_XHTML_STRING_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 14:05:22 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	EL_XHTML_STRING_LIST

inherit
	EL_LINKED_STRING_LIST [ASTRING]

	EL_PLAIN_TEXT_LINE_STATE_MACHINE
		undefine
			is_equal, copy
		redefine
			call
		end

	EL_MODULE_STRING
		undefine
			is_equal, copy
		end

	EL_MODULE_XML
		undefine
			is_equal, copy
		end

create
	make_from_file

feature {NONE} -- Initialization

	make_from_file (file_path: EL_FILE_PATH)
			--
		local
			line_source: EL_FILE_LINE_SOURCE
		do
			make_empty
			create text_group_end_tags.make_from_array (<< "</p>" >>)
			across 1 |..| 6 as level loop
				text_group_end_tags.extend ("</h" + level.item.out + ">")
			end

			space_entity := XML.entity ({ASCII}.blank.to_natural_32)
			closed_pre_tag := XML.closed_tag ("pre")
			pre_tag := XML.open_tag ("pre")
			break_tag := XML.empty_tag ("br")

			create substitutions.make_from_array (<<
				[Non_breaking_space,	space_entity],
				[Tab, 					XML.entity ({ASCII}.Tabulation.to_natural_32)],
				[Line_break, 			break_tag]
			>>)
			create line_source.make (file_path)
			do_with_lines (agent initial, line_source)
			remove_trailing_line_breaks
		end

	remove_trailing_line_breaks
			-- remove any line break occurring immediately before tags: p, pre, h?
		local
			last_line, two_lines, end_tag, inbetween_chars: ASTRING
			tag_found: BOOLEAN
			pos_end_tag, pos_previous_tag: INTEGER
		do
			create last_line.make_empty
			from start until after loop
				from text_group_end_tags.start; tag_found := False until tag_found or text_group_end_tags.after loop
					end_tag := text_group_end_tags.item

					tag_found := item.has_substring (end_tag)
					if tag_found then
						-- look for break tag before end tag in current and previous line
						-- Example: "</br>    </p>
						two_lines := last_line + item.string
						pos_end_tag := two_lines.substring_index (end_tag, 1)
						pos_previous_tag  := two_lines.last_index_of ('<', pos_end_tag - 1)
						if pos_previous_tag > 0
							and then two_lines.substring (pos_previous_tag, pos_previous_tag + break_tag.count - 1) ~ break_tag
						then
							inbetween_chars := two_lines.substring (pos_previous_tag + break_tag.count, pos_end_tag - 1)
							inbetween_chars.left_adjust
							if inbetween_chars.is_empty then
								last_line.share (two_lines.substring (1, pos_previous_tag - 1))
									-- Remove <br> from previous line or current line
								item.share (once "%T" + two_lines.substring (pos_end_tag, two_lines.count))
									-- Set current line to indented end tag
							end
						end
					else
						text_group_end_tags.forth
					end
				end
				last_line := item
				forth
			end
		end

feature {NONE} -- State handlers

	initial (line: ASTRING)
			--
		do
			extend (XML_header)
			extend (line)
			state := agent body
		end

	body (line: ASTRING)
			--
		local
			trim_line: ASTRING
		do

			trim_line := line.string
			trim_line.left_adjust
			if trim_line.starts_with ("<meta ") then
				state := agent find_meta_tag_end
				find_meta_tag_end (line)

			elseif trim_line.starts_with (pre_tag) then
				state := agent find_pre_tag_end
				find_pre_tag_end (line)

			elseif trim_line.starts_with ("<p> </p>") then
				-- Ignore empty paragraph

			elseif trim_line.starts_with ("</p>") then
				extend (line)

			else
				if trim_line.starts_with ("<") then
					extend (line)
				else
					last.append_character (' ')
					last.append (trim_line)
				end
			end
		end

	find_meta_tag_end (line: ASTRING)
			--
		do
			if line.ends_with (">") then
				line.remove_tail (1)
				line.append ("/>")
				extend (line)
				state := agent body
			else
				extend (line)
			end
		end

	find_pre_tag_end (line: ASTRING)
			--
		do
			if line.ends_with (closed_pre_tag) then
				last.append (line)
				state := agent body
			else
				extend (line)
			end
		end

feature {NONE} -- Implementation

	call (line: ASTRING)
		-- call state procedure with item
		do
			from substitutions.start until substitutions.after loop
				line.replace_substring_all (substitutions.item.original, substitutions.item.new)
				substitutions.forth
			end
			Precursor (line)
		end

	break_tag: ASTRING

	pre_tag: ASTRING

	closed_pre_tag: ASTRING

	space_entity: ASTRING

	text_group_end_tags: ARRAYED_LIST [ASTRING]

	substitutions: ARRAYED_LIST [TUPLE [original, new: ASTRING]]

feature {NONE} -- Constants

	Non_breaking_space: ASTRING
		once
			Result := "&nbsp;"
		end

	Tab: ASTRING
		once
			Result := "%T"
		end

	Line_break: ASTRING
		once
			Result := "<br>"
		end

	XML_header: STRING = "[
		<?xml version="1.0" encoding="ISO-8859-15"?>
	]"

end
