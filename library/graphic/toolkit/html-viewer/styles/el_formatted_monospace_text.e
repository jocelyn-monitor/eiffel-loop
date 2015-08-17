﻿note
	description: "Monospace text with preformatted indentation. Corresponds to html 'pre' tag."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:30 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	EL_FORMATTED_MONOSPACE_TEXT

inherit
	EL_FORMATTED_TEXT_BLOCK
		redefine
			set_format, append_text, append_new_line
		end

create
	make

feature -- Element change

	append_text (a_text: ASTRING)
		local
			maximum_count: INTEGER
			lines: EL_LINKED_STRING_LIST [ASTRING]
			blank_line, padding, text: ASTRING
		do
			create lines.make_with_lines (a_text)
			maximum_count := String.maximum_count (lines)
			create padding.make_empty
			from lines.start until lines.after loop
				create padding.make_filled (' ', maximum_count - lines.item.count)
				lines.item.append (padding)
				lines.item.enclose (' ', ' ')
				lines.forth
			end
			check
				same_size: lines.first.count = lines.last.count
			end
			create blank_line.make_filled (' ', maximum_count + 2)
			lines.put_front (blank_line)
			lines.extend (blank_line)

			text := lines.joined_lines
			paragraphs.extend ([text, format.character])
			count := count + text.count
		end

	append_new_line
		do
			Precursor
			if {PLATFORM}.is_windows then
				--	Workaround for problem where bottom right hand character of preformmatted area seems to be missing
				paragraphs.finish
				if not paragraphs.after and then paragraphs.item.text = Double_new_line then
					paragraphs.replace ([New_line, format.character])
					paragraphs.extend ([New_line, New_line_format])
				end
			end
		end

feature {NONE} -- Implementation

	set_format
		do
			format := styles.preformatted_format
		end

end
