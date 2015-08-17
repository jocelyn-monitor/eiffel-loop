﻿note
	description: "Summary description for {EL_VISION_2_GUI_ROUTINES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-07-09 7:42:08 GMT (Thursday 9th July 2015)"
	revision: "8"

class
	EL_VISION_2_GUI_ROUTINES

inherit
	EL_CROSS_PLATFORM [EL_VISION_2_GUI_ROUTINES_IMPL]
		export
			{NONE} all
		end

	EL_MODULE_STRING
		export
			{NONE} all
		end

	EL_MODULE_LOG
		export
			{NONE} all
		end

	EV_STOCK_COLORS
		rename
			Implementation as Stock_colors_implementation
		end

	EV_STOCK_PIXMAPS
		rename
			Implementation as Implementation_pixmaps
		end

	EV_FRAME_CONSTANTS

	EV_FONT_CONSTANTS

	EL_MODULE_SCREEN
		rename
			Screen as Screen_properties
		end

create
	make

feature {NONE} -- Initialization

	make
			--
		do
			make_default
			create environment
			text_field_background_color := Implementation.text_field_background_color
			text_field_font := (create {EV_TEXT_FIELD}).font
			create screen
			create timer_list.make (3)
		end

feature -- Access

	text_field_background_color: EV_COLOR

	text_field_font: EV_FONT

	screen: EL_SCREEN
		-- Inherits EV_SCREEN

	application: EV_APPLICATION
		do
			Result := environment.application
		end

	environment: EV_ENVIRONMENT

	window_parent (widget: EV_WIDGET): EV_WINDOW
		local
			l_parent: EV_CONTAINER
			depth: INTEGER
		do
			from l_parent := widget.parent until attached {EV_WINDOW} l_parent or else depth > 50 loop
				l_parent := l_parent.parent
				depth := depth + 1
			end
			if attached {EV_WINDOW} l_parent as window then
				Result := window
			else
				create Result
			end
		end

feature -- Constants

	General_font_families: ARRAYED_LIST [ASTRING]
			-- monospace + proportional
		once
			if attached {ARRAYED_LIST [STRING_32]} environment.Font_families as families then
				create Result.make (families.count)
				Result.compare_objects
				from families.start until families.after loop
					Result.extend (families.item)
					families.forth
				end
			end
			sort (Result)
		end

	Monospace_font_families: ARRAYED_LIST [ASTRING]
			--
		local
			l_font: EL_FONT
			i_str, w_str: STRING
		once
			create Result.make (10)
			Result.compare_objects
			i_str := "i"; w_str := "w"
			across General_font_families as family loop
				create l_font.make_regular (family.item, 0.5)
				if l_font.string_width (i_str) = l_font.string_width (w_str) then
					Result.extend (family.item)
				end
			end
			sort (Result)
		end

feature -- Component factory

	color_from_rgb_code (a_rgb_24_bit: INTEGER): EL_COLOR
		do
			create Result.make_with_rgb_24_bit (a_rgb_24_bit)
		end

	label (a_text: READABLE_STRING_GENERAL): EV_LABEL
			--
		local
			l_text: READABLE_STRING_GENERAL
		do
			if attached {ASTRING} a_text as astring then
				l_text := astring.to_unicode
			else
				l_text := a_text
			end
			create Result.make_with_text (l_text)
			Result.align_text_left
		end

	label_with_font (a_text: READABLE_STRING_GENERAL; a_font: EV_FONT): EV_LABEL
			--
		do
			Result := label (a_text)
			Result.set_font (a_font)
		end

	label_with_font_and_color (a_text: READABLE_STRING_GENERAL; a_font: EV_FONT; a_text_color: EV_COLOR): EV_LABEL
			--
		do
			Result := label_with_font (a_text, a_font)
			Result.set_foreground_color (a_text_color)
		end

	horizontal_framed_box (
		inner_border_cms, a_padding_cms: REAL; a_text: STRING; a_widgets: ARRAY [EV_WIDGET]
	): EL_FRAME [EL_HORIZONTAL_BOX]
			--
		do
 			create Result.make_with_text (inner_border_cms, a_padding_cms, a_text)
 			Result.box.append_unexpanded (a_widgets)
		end

	horizontal_box (a_border_cms, a_padding_cms: REAL; a_widgets: ARRAY [EV_WIDGET]): EL_HORIZONTAL_BOX
			--
		do
 			create Result.make (a_border_cms, a_padding_cms)
 			Result.append_unexpanded (a_widgets)
		end

	menu_entry (a_text: ASTRING; an_action: PROCEDURE [ANY, TUPLE]): EV_MENU_ITEM
		local
			l_text: ASTRING
		do
			l_text := a_text
			create Result.make_with_text_and_action (l_text, an_action)
		end

	password_field (capacity: INTEGER): EV_PASSWORD_FIELD
			--
		do
			Result := password_field_with_font (capacity, text_field_font)
		end

	password_field_with_font (capacity: INTEGER; a_font: EV_FONT): EV_PASSWORD_FIELD
			--
		do
			create Result
			set_text_field_characteristics (Result, capacity, a_font)
		end

	text_field (capacity: INTEGER): EV_TEXT_FIELD
			--
		do
			Result := text_field_with_font (capacity, text_field_font)
		end

	text_field_with_font (capacity: INTEGER; a_font: EV_FONT): EV_TEXT_FIELD
			--
		do
			create Result
			set_text_field_characteristics (Result, capacity, a_font)
		end

	vertical_box (a_border_cms, a_padding_cms: REAL; a_widgets: ARRAY [EV_WIDGET]): EL_VERTICAL_BOX
			--
		do
 			create Result.make (a_border_cms, a_padding_cms)
 			Result.append_unexpanded (a_widgets)
		end

	vertical_centered_box (a_border_cms, a_padding_cms: REAL; a_widgets: ARRAY [EV_WIDGET]): EL_VERTICAL_BOX
			--
		do
 			create Result.make (a_border_cms, a_padding_cms)
 			Result.extend (create {EV_CELL})
 			Result.append_unexpanded (a_widgets)
 			Result.extend (create {EV_CELL})
		end

	vertical_framed_box (
		inner_border_cms, a_padding_cms: REAL; a_text: STRING; a_widgets: ARRAY [EV_WIDGET]
	): EL_FRAME [EL_VERTICAL_BOX]
			--
		do
 			create Result.make_with_text (inner_border_cms, a_padding_cms, a_text)
 			Result.box.append_unexpanded (a_widgets)
		end

feature -- Font factory

	font_regular (a_families_list: STRING; a_height_cms: REAL): EL_FONT
			-- families separated by ';'
		do
			create Result.make_regular ("", a_height_cms) -- Adds to preferred_families
			across a_families_list.split (';') as family loop
				Result.preferred_families.extend (family.item)
			end
		end

	font_bold (a_families_list: STRING; a_height_cms: REAL): EL_FONT
			-- families separated by ';'
		do
			Result := font_regular (a_families_list, a_height_cms)
			Result.set_weight (Weight_bold)
		end

feature -- Basic operations

	enable_sensitive_if (item: EV_SENSITIVE; condition_true: BOOLEAN)
		do
			if condition_true then
				item.enable_sensitive
			else
				item.disable_sensitive
			end
		end

	apply_background_color (a_components: ARRAY [EV_COLORIZABLE]; color: EV_COLOR)
			--
		do
			a_components.do_all (agent {EV_COLORIZABLE}.set_background_color (color))
		end

	apply_foreground_color (a_components: ARRAY [EV_COLORIZABLE]; color: EV_COLOR)
			--
		do
			a_components.do_all (agent {EV_COLORIZABLE}.set_foreground_color (color))
		end

	apply_foreground_and_background_color (
		a_components: ARRAY [EV_COLORIZABLE]; foreground_color, background_color: EV_COLOR
	)
			--
		do
			apply_foreground_color (a_components, foreground_color)
			apply_background_color (a_components, background_color)
		end

	do_once_on_idle (an_action: PROCEDURE [ANY, TUPLE])
		do
			application.do_once_on_idle (an_action)
		end

	do_later (a_action: PROCEDURE [ANY, TUPLE]; millisecs_interval: INTEGER_32)
		local
			timer: EV_TIMEOUT
		do
			create timer.make_with_interval (millisecs_interval)
			timer_list.extend (timer)
			timer.actions.extend_kamikaze (a_action)
			timer.actions.extend_kamikaze (agent prune_timer (timer))
		end

	set_selection (widget: EV_SELECTABLE; is_selected: BOOLEAN)
		require
			has_select_actions: attached {EV_BUTTON_ACTION_SEQUENCES} widget or attached {EV_MENU_ITEM_ACTION_SEQUENCES} widget
		local
			select_actions: EV_NOTIFY_ACTION_SEQUENCE
		do
			if attached {EV_BUTTON_ACTION_SEQUENCES} widget as action_sequences then
				select_actions := action_sequences.select_actions

			elseif attached {EV_MENU_ITEM_ACTION_SEQUENCES} widget as action_sequences then
				select_actions := action_sequences.select_actions

			end
			select_actions.block
			if attached {EV_SELECTABLE} widget as selectable_button and then is_selected then
				selectable_button.enable_select

			elseif attached {EV_DESELECTABLE} widget as deselectable_button and then not is_selected then
				deselectable_button.disable_select
			end
			select_actions.resume
		end

	set_text_field_characteristics (field: EV_TEXT_FIELD; capacity: INTEGER; a_font: EV_FONT)
			--
		do
			field.set_font (a_font)
--			field.set_minimum_width (a_font.maximum_width * capacity + a_font.maximum_width // 3)
			field.set_minimum_width_in_characters (capacity)
		end

	propagate_background_color (container: EV_CONTAINER; background_color: EV_COLOR; exclusions: ARRAY [EV_WIDGET])
			-- Propagate background
		require
			 exclusions_comparable_by_reference: not exclusions.object_comparison
		local
			list: LINEAR [EV_WIDGET]
		do
			if not exclusions.has (container) then
				container.set_background_color (background_color)
			end
			list := container.linear_representation
			from list.start until list.after loop
				if attached {EV_CONTAINER} list.item as l_container
					and then not exclusions.has (l_container)
				then
					propagate_background_color (l_container, background_color, exclusions)

				elseif not exclusions.has (list.item) then
					list.item.set_background_color (background_color)
				end
				list.forth
			end
		end

feature -- Mouse pointer setting

	restore_standard_pointer (widget: EV_WIDGET; seconds_delay: INTEGER)
		do
			do_later (agent (window_parent (widget)).set_pointer_style (Standard_cursor), seconds_delay * 1000)
		end

	set_busy_pointer_left (widget: EV_WIDGET)
		do
			set_busy_pointer (widget, 0, widget.height // 2)
		end

	set_busy_pointer_right (widget: EV_WIDGET)
		do
			set_busy_pointer (widget, widget.width, widget.height // 2)
		end

	set_busy_pointer_top (widget: EV_WIDGET)
		do
			set_busy_pointer (widget, widget.width // 2, 0)
		end

	set_busy_pointer_bottom (widget: EV_WIDGET)
		do
			set_busy_pointer (widget, widget.width // 2, widget.height)
		end

	set_busy_pointer_center (widget: EV_WIDGET)
		do
			set_busy_pointer (widget, widget.width // 2, widget.height // 2)
		end

	set_busy_pointer (widget: EV_WIDGET; position_x, position_y: INTEGER)
		local
			container: EV_CONTAINER; offset_x, offset_y: INTEGER
		do
			if position_x = 0 then
				offset_x := Busy_cursor.x_hotspot - Busy_cursor.width
			else
				offset_x := Busy_cursor.x_hotspot
			end
			if position_y = 0 then
				offset_y := Busy_cursor.y_hotspot - Busy_cursor.height
			else
				offset_y := Busy_cursor.y_hotspot
			end
			Screen.set_pointer_position (widget.screen_x + position_x + offset_x, widget.screen_y + position_y + offset_y)
			window_parent (widget).set_pointer_style (Busy_cursor)
			if {PLATFORM}.is_windows then
				application.process_events
			end
		end

feature -- Contract support

	is_word_wrappable (a_text: ASTRING; a_font: EV_FONT; a_width: INTEGER): BOOLEAN
		do
			Result := across a_text.split (' ') as word all a_font.string_width (word.item) < a_width end
		end

feature -- Measurement

	widest_width (strings: INDEXABLE [READABLE_STRING_GENERAL, INTEGER]; font: EV_FONT): INTEGER
			-- widest string width for font
		local
			i, count, width: INTEGER
			l_str: READABLE_STRING_GENERAL
		do
			count := strings.index_set.upper
			from i := 1 until i > count loop
				l_str := strings [i]
				if attached {ASTRING} l_str as l_astr then
					l_str := l_astr.to_unicode
				end
				width := font.string_width (l_str)
				if width > Result then
					Result := width
				end
				i := i + 1
			end
		end

	box_width_real (border_cms, padding_cms: REAL; widget_widths: ARRAY [REAL]): REAL
		do
			Result := border_cms * 2 + padding_cms * (widget_widths.count - 1)
			across widget_widths as width loop
				Result := Result + width.item
			end
		end

feature -- Conversion

	word_wrapped (a_text: ASTRING; a_font: EV_FONT; a_width: INTEGER): ASTRING
			--
		require
			is_wrappable: is_word_wrappable (a_text, a_font, a_width)
		local
			wrapped_lines, words: EL_ASTRING_LIST
			line: ASTRING
		do
			create wrapped_lines.make (10)
			create line.make (60)
			create words.make_with_words (a_text)
			from words.start until words.after loop
				if not line.is_empty then
					line.append_character (' ')
				end
				line.append (words.item)
				if a_font.string_width (line.to_unicode) > a_width then
					line.remove_tail (words.item.count)
					line.right_adjust
					wrapped_lines.extend (line.twin)
					line.wipe_out
				else
					words.forth
				end
			end
			if not line.is_empty then
				wrapped_lines.extend (line)
			end
			Result := wrapped_lines.joined_lines
		end

	rgb_code_to_html_code (rgb_code: INTEGER): STRING
			-- RGB color code as HTML color code
		do
			Result := rgb_code.to_hex_string
			Result.remove_head (1)
			Result.put ('#', 1)
		end

	html_code_to_rgb_code (html_code: STRING): INTEGER
		require
			starts_with_hash: html_code.item (1) = '#'
			has_six_digits: html_code.count = 7
		do
			Result := String.hexadecimal_to_integer (html_code.substring (2, 7))
		end

feature {NONE} -- Implementation

	sort (a_list: ARRAYED_LIST [ASTRING])
		local
			l_array: SORTABLE_ARRAY [ASTRING]
		do
			create l_array.make_from_array (a_list.to_array)
			l_array.compare_objects
			l_array.sort
		end

	prune_timer (timer: EV_TIMEOUT)
		do
			timer.set_interval (0)
			timer_list.prune (timer)
		end

	timer_list: ARRAYED_LIST [EV_TIMEOUT]

end
