note
	description: "[
		Objects that represent an EV_TITLED_WINDOW.
		The original version of this class was generated by EiffelBuild.
		This class is the implementation of an EV_TITLED_WINDOW generated by EiffelBuild.
		You should not modify this code by hand, as it will be re-generated every time
		 modifications are made to the project.
	]"

	status: "See notice at end of class."

	legal: "See notice at end of class."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2013 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2009-08-06 8:38:56 GMT (Thursday 6th August 2009)"
	revision: "2"

deferred class
	MINI_TOOL_BAR_IMP

inherit
	EV_HORIZONTAL_BOX
		redefine
			initialize, is_in_default_state
		end

	CONSTANTS
		undefine
			is_equal, default_create, copy
		end

feature {NONE}-- Initialization

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_HORIZONTAL_BOX}
			initialize_constants

				-- Build widget structure.
			extend (l_ev_button_1)
			extend (l_ev_check_button_1)
			extend (l_ev_checkable_list_1)
			l_ev_checkable_list_1.extend (l_ev_list_item_1)
			extend (l_ev_checkable_tree_1)
			l_ev_checkable_tree_1.extend (l_ev_tree_item_1)
			l_ev_tree_item_1.extend (l_ev_tree_item_2)
			extend (l_ev_combo_box_1)
			extend (l_ev_drawing_area_1)
			extend (l_ev_grid_1)
			extend (l_ev_header_1)
			extend (l_ev_horizontal_progress_bar_1)
			extend (l_ev_horizontal_range_1)
			extend (l_ev_horizontal_scroll_bar_1)
			extend (l_ev_vertical_separator_1)
			extend (l_ev_horizontal_separator_1)
			extend (l_ev_label_1)
			extend (l_ev_radio_button_1)
			extend (l_ev_spin_button_1)

			l_ev_button_1.set_text ("Button")
			l_ev_check_button_1.set_text ("Check Box")
			l_ev_checkable_list_1.set_minimum_width (30)
			l_ev_list_item_1.set_text ("List Item")
			l_ev_checkable_tree_1.set_minimum_width (30)
			l_ev_tree_item_1.set_text ("Tree Item")
			l_ev_tree_item_2.set_text ("Tree Item")
			l_ev_header_1.set_minimum_width (30)
			l_ev_horizontal_progress_bar_1.set_minimum_width (50)
			l_ev_horizontal_range_1.set_minimum_width (50)
			l_ev_horizontal_scroll_bar_1.set_minimum_width (20)
			l_ev_label_1.set_text ("Label")
			l_ev_radio_button_1.set_text ("Radio Button")
			disable_item_expand (l_ev_button_1)
			disable_item_expand (l_ev_check_button_1)
			disable_item_expand (l_ev_checkable_list_1)
			disable_item_expand (l_ev_checkable_tree_1)
			disable_item_expand (l_ev_combo_box_1)
			disable_item_expand (l_ev_drawing_area_1)
			disable_item_expand (l_ev_grid_1)
			disable_item_expand (l_ev_header_1)
			disable_item_expand (l_ev_horizontal_progress_bar_1)
			disable_item_expand (l_ev_horizontal_range_1)
			disable_item_expand (l_ev_horizontal_scroll_bar_1)
			disable_item_expand (l_ev_horizontal_separator_1)
			disable_item_expand (l_ev_label_1)
			disable_item_expand (l_ev_radio_button_1)
			disable_item_expand (l_ev_spin_button_1)

			set_all_attributes_using_constants

				-- Call `user_initialization'.
			user_initialization
		end


feature {NONE} -- Implementation

	l_ev_combo_box_1: EV_COMBO_BOX
	l_ev_list_item_1: EV_LIST_ITEM
	l_ev_checkable_list_1: EV_CHECKABLE_LIST
	l_ev_grid_1: EV_GRID
	l_ev_drawing_area_1: EV_DRAWING_AREA
	l_ev_horizontal_separator_1: EV_HORIZONTAL_SEPARATOR
	l_ev_horizontal_progress_bar_1: EV_HORIZONTAL_PROGRESS_BAR
	l_ev_spin_button_1: EV_SPIN_BUTTON
	l_ev_button_1: EV_BUTTON
	l_ev_tree_item_1,
	l_ev_tree_item_2: EV_TREE_ITEM
	l_ev_horizontal_scroll_bar_1: EV_HORIZONTAL_SCROLL_BAR
	l_ev_radio_button_1: EV_RADIO_BUTTON
	l_ev_label_1: EV_LABEL
	l_ev_checkable_tree_1: EV_CHECKABLE_TREE
	l_ev_check_button_1: EV_CHECK_BUTTON
	l_ev_horizontal_range_1: EV_HORIZONTAL_RANGE
	l_ev_header_1: EV_HEADER
	l_ev_vertical_separator_1: EV_VERTICAL_SEPARATOR

feature {NONE} -- Implementation

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			-- Re-implement if you wish to enable checking
			-- for `Current'.
			Result := True
		end

	user_initialization
			-- Feature for custom initialization, called at end of `initialize'.
		deferred
		end

feature {NONE} -- Constant setting

	set_attributes_using_string_constants
			-- Set all attributes relying on string constants to the current
			-- value of the associated constant.
		local
			s: detachable STRING_GENERAL
		do
			from
				string_constant_set_procedures.start
			until
				string_constant_set_procedures.off
			loop
				string_constant_retrieval_functions.i_th (string_constant_set_procedures.index).call (Void)
				s := string_constant_retrieval_functions.i_th (string_constant_set_procedures.index).last_result
				check s /= Void end -- Implied by design of EiffelBuild
				string_constant_set_procedures.item.call ([s])
				string_constant_set_procedures.forth
			end
		end

	set_attributes_using_integer_constants
			-- Set all attributes relying on integer constants to the current
			-- value of the associated constant.
		local
			i: INTEGER
			arg1, arg2: INTEGER
			int: INTEGER_INTERVAL
		do
			from
				integer_constant_set_procedures.start
			until
				integer_constant_set_procedures.off
			loop
				integer_constant_retrieval_functions.i_th (integer_constant_set_procedures.index).call (Void)
				i := integer_constant_retrieval_functions.i_th (integer_constant_set_procedures.index).last_result
				integer_constant_set_procedures.item.call ([i])
				integer_constant_set_procedures.forth
			end
			from
				integer_interval_constant_retrieval_functions.start
				integer_interval_constant_set_procedures.start
			until
				integer_interval_constant_retrieval_functions.off
			loop
				integer_interval_constant_retrieval_functions.item.call (Void)
				arg1 := integer_interval_constant_retrieval_functions.item.last_result
				integer_interval_constant_retrieval_functions.forth
				integer_interval_constant_retrieval_functions.item.call (Void)
				arg2 := integer_interval_constant_retrieval_functions.item.last_result
				create int.make (arg1, arg2)
				integer_interval_constant_set_procedures.item.call ([int])
				integer_interval_constant_retrieval_functions.forth
				integer_interval_constant_set_procedures.forth
			end
		end

	set_attributes_using_pixmap_constants
			-- Set all attributes relying on pixmap constants to the current
			-- value of the associated constant.
		local
			p: detachable EV_PIXMAP
		do
			from
				pixmap_constant_set_procedures.start
			until
				pixmap_constant_set_procedures.off
			loop
				pixmap_constant_retrieval_functions.i_th (pixmap_constant_set_procedures.index).call (Void)
				p := pixmap_constant_retrieval_functions.i_th (pixmap_constant_set_procedures.index).last_result
				check p /= Void end -- Implied by design of EiffelBuild
				pixmap_constant_set_procedures.item.call ([p])
				pixmap_constant_set_procedures.forth
			end
		end

	set_attributes_using_font_constants
			-- Set all attributes relying on font constants to the current
			-- value of the associated constant.
		local
			f: detachable EV_FONT
		do
			from
				font_constant_set_procedures.start
			until
				font_constant_set_procedures.off
			loop
				font_constant_retrieval_functions.i_th (font_constant_set_procedures.index).call (Void)
				f := font_constant_retrieval_functions.i_th (font_constant_set_procedures.index).last_result
				check f /= Void end -- Implied by design of EiffelBuild
				font_constant_set_procedures.item.call ([f])
				font_constant_set_procedures.forth
			end
		end

	set_attributes_using_color_constants
			-- Set all attributes relying on color constants to the current
			-- value of the associated constant.
		local
			c: detachable EV_COLOR
		do
			from
				color_constant_set_procedures.start
			until
				color_constant_set_procedures.off
			loop
				color_constant_retrieval_functions.i_th (color_constant_set_procedures.index).call (Void)
				c := color_constant_retrieval_functions.i_th (color_constant_set_procedures.index).last_result
				check c /= Void end -- Implied by design of EiffelBuild
				color_constant_set_procedures.item.call ([c])
				color_constant_set_procedures.forth
			end
		end

	set_all_attributes_using_constants
			-- Set all attributes relying on constants to the current
			-- calue of the associated constant.
		do
			set_attributes_using_string_constants
			set_attributes_using_integer_constants
			set_attributes_using_pixmap_constants
			set_attributes_using_font_constants
			set_attributes_using_color_constants
		end

	string_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [STRING_GENERAL]]]
	string_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], STRING_GENERAL]]
	integer_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [INTEGER]]]
	integer_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], INTEGER]]
	pixmap_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_PIXMAP]]]
	pixmap_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_PIXMAP]]
	integer_interval_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], INTEGER]]
	integer_interval_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [INTEGER_INTERVAL]]]
	font_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_FONT]]]
	font_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_FONT]]
	color_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_COLOR]]]
	color_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_COLOR]]

	integer_from_integer (an_integer: INTEGER): INTEGER
			-- Return `an_integer', used for creation of
			-- an agent that returns a fixed integer value.
		do
			Result := an_integer
		end

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end
