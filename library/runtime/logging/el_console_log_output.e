note
	description: "Summary description for {EL_LOG_OUTPUT}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-09 14:20:53 GMT (Saturday 9th November 2013)"
	revision: "3"

class
	EL_CONSOLE_LOG_OUTPUT

inherit
	EL_MODULE_ENVIRONMENT

	EL_LOG_CONSTANTS

create
	make

feature -- Initialization

	make
		do
			create buffer.make (80)
			create string_pool.make (80)
			create new_line_prompt.make_from_string ("%N")
		end

feature -- Element change

	tab (offset: INTEGER)
			--
		do
			tab_repeat_count := tab_repeat_count.item + offset
		end

	tab_left
			--
		do
			tab_repeat_count := tab_repeat_count.item - 1
		end

	tab_right
			--
		do
			tab_repeat_count := tab_repeat_count.item + 1
		end

	restore (previous_stack_count: INTEGER)
			--
		do
			tab_repeat_count := previous_stack_count
		end

feature -- Output

	put_string (s: STRING)
		require
			not_augmented_latin_string: not attached {EL_ASTRING} s
		do
			buffer.extend (s)
		end

	put_separator
		do
			buffer.extend (Line_separator)
			put_new_line
		end

	put_keyword (keyword: STRING)
		require
			not_augmented_latin_string: not attached {EL_ASTRING} keyword
		do
			set_text_red
			buffer.extend (keyword)
			set_text_default
		end

	put_classname (a_name: STRING)
		require
			not_augmented_latin_string: not attached {EL_ASTRING} a_name
		do
			set_text_light_blue
			buffer.extend (a_name)
			set_text_default
		end

	put_label (a_name: READABLE_STRING_GENERAL)
		do
			set_text_purple
			put_string_general (a_name)
			set_text_default
			put_string (once ": ")
		end

	put_quoted_string (a_str: READABLE_STRING_GENERAL)
		do
			set_text_brown
			put_string (once "%"")
			put_string_general (a_str)
			put_string (once "%"")
			set_text_default
		end

	put_string_general (s: READABLE_STRING_GENERAL)
			--
		local
			l_str: EL_ASTRING
		do
			l_str := new_string
			if attached {EL_ASTRING} s as l_astr then
				l_str.append (l_astr)
			else
				l_str.append_unicode_general (s)
			end
			buffer.extend (l_str)
		end

	put_lines (lines: LIST [EL_ASTRING])
			--
		local
			l_str: EL_ASTRING
		do
			from lines.start until lines.off loop
				l_str := new_string; l_str.append (lines.item)
				set_text_brown
				buffer.extend (l_str)
				set_text_default
				lines.forth
				if not lines.after then
					put_new_line
				end
			end
		end

	put_integer (i: INTEGER)
			-- Add a string to the buffer
		local
			numeric_str: EL_ASTRING
		do
			numeric_str := new_string
			numeric_str.append_integer (i)
			buffer.extend (numeric_str)
		end

	put_character (c: CHARACTER)
			--
		local
			character_str: EL_ASTRING
		do
			character_str := new_string
			character_str.append_character (c)
			buffer.extend (character_str)
		end

	put_real (r: REAL)
			--
		local
			numeric_str: EL_ASTRING
		do
			numeric_str := new_string
			numeric_str.append_real (r)
			buffer.extend (numeric_str)
		end

	put_boolean (b: BOOLEAN)
			--
		local
			numeric_str: EL_ASTRING
		do
			numeric_str := new_string
			numeric_str.append_boolean (b)
			buffer.extend (numeric_str)
		end

	put_double (d: DOUBLE)
			--
		local
			numeric_str: EL_ASTRING
		do
			numeric_str := new_string
			numeric_str.append_double (d)
			buffer.extend (numeric_str)
		end

	put_new_line
			-- Add a string to the buffer
		local
			i: INTEGER
		do
			buffer.extend (new_line_prompt)
			from
				i := 1
			until
				i > tab_repeat_count
			loop
				buffer.extend (Tab_string)
				i := i + 1
			end
		end

feature -- Basic operations

	flush
			-- Write contents of buffer to file if it is free (not locked by another thread)
			-- Return strings of type {EL_ASTRING} to recyle pool
		do
			from buffer.start until buffer.after loop
				if attached {EL_ASTRING} buffer.item as l_astr then
					write_string (l_astr)
					recycle (l_astr)

				elseif attached {STRING} buffer.item as l_str8 then
					write_string_8 (l_str8)
				end
				buffer.forth
			end
			buffer.wipe_out
		end

feature -- Change text output color

	set_text_red
		do
			buffer.extend (Escape_color_red)
		end

	set_text_blue
		do
			buffer.extend (Escape_color_blue)
		end

	set_text_brown
		do
			buffer.extend (Escape_color_brown)
		end

	set_text_dark_gray
		do
			buffer.extend (escape_color_dark_gray)
		end

	set_text_purple
		do
			buffer.extend (Escape_color_purple)
		end

	set_text_light_blue
		do
			buffer.extend (Escape_color_light_blue)
		end

	set_text_light_green
		do
			buffer.extend (Escape_color_light_green)
		end

	set_text_light_cyan
		do
			buffer.extend (Escape_color_light_cyan)
		end

	set_text_default
		do
			buffer.extend (Escape_color_default)
		end

feature {NONE} -- Implementation

	write_string (str: EL_ASTRING)
		do
			io.put_string (str.to_utf8)
		end

	write_string_8 (str8: STRING)
			-- Write str8 filtering color high lighting control sequences
		do
			if not Escape_sequences.has (str8) then
				io.put_string (str8)
			end
		end

	new_string: EL_ASTRING
		do
			if string_pool.is_empty then
				create Result.make_empty
			else
				Result := string_pool.item
				string_pool.remove
			end
		end

	recycle (a_str: EL_ASTRING)
		do
			a_str.wipe_out
			string_pool.put (a_str)
		end

	buffer: ARRAYED_LIST [READABLE_STRING_GENERAL]

	string_pool: ARRAYED_STACK [EL_ASTRING]
		-- recycled strings

	tab_repeat_count: INTEGER

	new_line_prompt: STRING

feature -- Constants

	Line_separator: STRING
		once
			create Result.make_filled ('-', 100)
		end

feature {NONE} -- Constants

	Tail_character_count : INTEGER = 1500

	Tab_string: STRING = "  "

	Escape_color_red: STRING = "%/027/[1;31m"

	Escape_color_blue: STRING = "%/027/[0;34m"

	Escape_color_brown: STRING = "%/027/[0;33m"

	Escape_color_light_blue: STRING = "%/027/[1;34m"

	Escape_color_dark_gray: STRING = "%/027/[1;30m"

	Escape_color_purple: STRING = "%/027/[1;35m"

	Escape_color_light_green: STRING = "%/027/[1;32m"

	Escape_color_light_cyan: STRING = "%/027/[1;36m"

	Escape_color_default: STRING = "%/027/[0m"

	Escape_sequences: ARRAY [STRING]
		once
			Result := <<
				Escape_color_red, Escape_color_blue, Escape_color_brown, Escape_color_dark_gray, Escape_color_purple,
				Escape_color_light_blue, Escape_color_light_green, Escape_color_light_cyan, Escape_color_default
			>>
		end

end
