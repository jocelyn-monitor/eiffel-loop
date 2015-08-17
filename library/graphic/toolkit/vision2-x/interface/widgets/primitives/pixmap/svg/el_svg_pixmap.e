﻿note
	description: "${description}"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-07-07 11:06:34 GMT (Tuesday 7th July 2015)"
	revision: "6"

class
	EL_SVG_PIXMAP

inherit
	EL_PIXMAP
		rename
			pixmap_path as pixmap_path,
			background_color as pixmap_background_color
		redefine
			make_from_other, initialize, set_background_color
		end

	EL_MODULE_FILE_SYSTEM
		undefine
			default_create, is_equal, copy
		end

	EL_MODULE_SCREEN
		undefine
			default_create, is_equal, copy
		end

	EL_MODULE_LOG
		undefine
			default_create, is_equal, copy
		end

	EL_MODULE_DIRECTORY
		undefine
			default_create, is_equal, copy
		end

	EL_SHARED_FILE_PROGRESS_LISTENER
		undefine
			default_create, is_equal, copy
		end

	EL_SHARED_ONCE_STRINGS
		undefine
			default_create, is_equal, copy
		end

	EV_BUILDER

create
	default_create, make_from_other,

	make_with_width_cms, make_with_height_cms,
	make_with_width, make_with_height,
	make_with_path_and_width, make_with_path_and_height,

	make_transparent_with_width, make_transparent_with_height,
	make_transparent_with_width_cms, make_transparent_with_height_cms,
	make_transparent_with_path_and_width, make_transparent_with_path_and_height

feature {NONE} -- Initialization

	initialize
		do
			Precursor
			create svg_path
			create png_output_path
		end

	make_from_other (other: like Current)
			--
		do
			default_create
			is_width_scaled := other.is_width_scaled
			dimension := other.dimension
			svg_path := other.svg_path
			png_output_path := other.png_output_path
			pixmap_path := other.pixmap_path
			create text_origin.make (other.text_origin.x, other.text_origin.y)
			set_background_color (other.background_color)
			update_pixmap (svg_path)
			is_made := update_pixmap_on_initialization
		end

	make_with_height (a_svg_path: like svg_path; a_height: INTEGER; a_background_color: EL_COLOR)
			--
		do
			make_with_path_and_height (a_svg_path, a_height, a_background_color)
		end

	make_with_height_cms (a_svg_path: like svg_path; a_height_cms: REAL; a_background_color: EL_COLOR)
			--
		do
			make_with_path_and_height (
				a_svg_path, Screen.vertical_pixels (a_height_cms), a_background_color
			)
		end

	make_with_width (a_svg_path: like svg_path; a_width: INTEGER; a_background_color: EL_COLOR)
			--
		do
			make_with_path_and_width (a_svg_path, a_width, a_background_color)
		end

	make_with_width_cms (a_svg_path: like svg_path; a_width_cms: REAL; a_background_color: EL_COLOR)
			--
		do
			make_with_path_and_width (
				a_svg_path, Screen.horizontal_pixels (a_width_cms), a_background_color
			)
		end

	make_with_path_and_width (a_svg_path: like svg_path;  a_width: INTEGER; a_background_color: EL_COLOR)
			--
		do
			default_create
			svg_path := a_svg_path
			create text_origin
			is_width_scaled := True
			set_dimension (a_width)
			set_background_color (a_background_color)
			is_made := update_pixmap_on_initialization
			update_pixmap_if_made
		end

	make_with_path_and_height (a_svg_path: like svg_path; a_height: INTEGER; a_background_color: EL_COLOR)
			--
		do
			default_create
			svg_path := a_svg_path
			create text_origin
			is_width_scaled := False
			set_dimension (a_height)
			set_background_color (a_background_color)
			is_made := update_pixmap_on_initialization
			update_pixmap_if_made
		end

	make_transparent_with_height (a_svg_path: like svg_path; a_height: INTEGER)
			--
		do
			make_with_height (a_svg_path, a_height, Transparent_color)
		end

	make_transparent_with_height_cms (a_svg_path: like svg_path; a_height_cms: REAL)
			--
		do
			make_with_height_cms (a_svg_path, a_height_cms, Transparent_color)
		end

	make_transparent_with_width (a_svg_path: like svg_path; a_width: INTEGER)
			--
		do
			make_with_width (a_svg_path, a_width, Transparent_color)
		end

	make_transparent_with_width_cms (a_svg_path: like svg_path; a_width_cms: REAL)
			--
		do
			make_with_width_cms (a_svg_path, a_width_cms, Transparent_color)
		end

	make_transparent_with_path_and_width (a_svg_path: like svg_path; a_width: INTEGER)
			--
		do
			make_with_path_and_width (a_svg_path, a_width, Transparent_color)
		end

	make_transparent_with_path_and_height (a_svg_path: like svg_path; a_height: INTEGER)
			--
		do
			make_with_path_and_height (a_svg_path, a_height, Transparent_color)
		end

feature -- Access

	svg_path: EL_FILE_PATH

	png_output_path: EL_FILE_PATH
		-- png output path

	dimension: INTEGER
		-- pixel dimension width or height depending on is_width_scaled

	background_color: EL_COLOR
		do
			if is_transparent then
				create Result.make_transparent
			else
				create Result.make (pixmap_background_color)
			end
		end

feature -- Status report

	is_width_scaled: BOOLEAN

	is_transparent: BOOLEAN

feature -- Element change

	set_svg_path (a_svg_path: like svg_path)
		do
			svg_path := a_svg_path
			update_pixmap_if_made
		end

	set_dimension (a_dimension: INTEGER)
			--
		do
			dimension := a_dimension
			update_pixmap_if_made
		end

	set_dimension_cms (a_dimension_cms: REAL)
			--
		do
			if is_width_scaled then
				dimension := Screen.horizontal_pixels (a_dimension_cms)
			else
				dimension := Screen.vertical_pixels (a_dimension_cms)
			end
			update_pixmap_if_made
		end

	set_background_color (a_background_color: like background_color)
			--
		do
			Precursor (a_background_color)
			is_transparent := a_background_color.is_transparent
			update_pixmap_if_made
		end

	set_transparent_background_color
		do
			is_transparent := True
		end

feature {EL_SVG_PIXMAP} -- Implementation

	set_pixmap_path_from_svg
		do
			png_output_path := png_output_dir.joined_dir_path (unique_rendering_name) + svg_path.base
			png_output_path.replace_extension (Extension_png)
			pixmap_path := png_output_path.to_path
		end

	unique_rendering_name: ASTRING
			-- name that is unique for combinded rendering variables
		local
			hex_string: ASTRING
		do
			Result := empty_once_string
			across rendering_variables as modifier loop
				if modifier.cursor_index > 1 then
					Result.append_character ('.')
				end
				Result.append (modifier.item.code)
				hex_string := modifier.item.value.to_hex_string
				hex_string.prune_all_leading ('0')
				if hex_string.is_empty then
					Result.append_character ('0')
				else
					Result.append (hex_string)
				end
			end
		end

	png_output_dir: EL_DIR_PATH
		local
			base_path, pixmap_base_path: EL_DIR_PATH
			relative_dir: EL_PATH_STEPS
		do
			base_path := Directory.Application_installation
			if base_path.is_parent_of (svg_path) then
				pixmap_base_path := Directory.User_configuration
			else
				base_path := svg_path.parent
				pixmap_base_path := base_path
			end
			relative_dir := svg_path.relative_path (base_path).parent
			Result := pixmap_base_path.joined_dir_path (relative_dir)
		end

	update_pixmap_if_made
		do
			if is_made then
				set_pixmap_path_from_svg
				update_pixmap (svg_path)
			end
		end

	update_pixmap (a_svg_path: like svg_path)
			--
		local
			png_dir: EL_DIR_PATH; png_image_file: EL_PNG_IMAGE_FILE
			l_svg_xml: like svg_xml
		do
--			log.enter_no_header ("update_pixmap")
			if a_svg_path.exists and then not png_output_path.exists then
				l_svg_xml := svg_xml (a_svg_path)
				file_listener.on_write (l_svg_xml.count)

				png_dir := png_output_path.parent
				File_system.make_directory (png_dir)
--				log_or_io.put_string_field ("Writing", png_output_path.to_string)
--				log_or_io.put_new_line
				create png_image_file.make_open_write (png_output_path)
				if is_width_scaled then
					png_image_file.render_svg_of_width (a_svg_path, l_svg_xml, dimension, background_color.rgb_32_bit)
				else
					png_image_file.render_svg_of_height (a_svg_path, l_svg_xml, dimension, background_color.rgb_32_bit)
				end
				png_image_file.close
				file_listener.on_write (png_image_file.count)
			end
			if png_output_path.exists then
				set_with_named_path (pixmap_path)
				pixmap_exists := True
			end
--			log.exit_no_trailer
		ensure
			write_succeeded: a_svg_path.exists implies pixmap_exists
		end

	svg_xml (a_svg_path: like svg_path): STRING
		do
			Result := File_system.plain_text (a_svg_path)
		end

	update_pixmap_on_initialization: BOOLEAN
		do
			Result := True
		end

	set_centered_text_origin (a_width, a_height, left_offset, right_offset: INTEGER)
			--
		do
			create text_origin.make (((width - a_width) / 2).rounded, ((height - a_height) / 2).rounded)
		end

	rendering_variables: ARRAYED_LIST [like Type_rendering_variable]
		do
			create Result.make (5)
			if is_width_scaled then
				Result.extend ([Initial_w, dimension])
			else
				Result.extend ([Initial_h, dimension])
			end
			Result.extend ([Initial_c, background_color.rgb_32_bit])
		end

	is_made: BOOLEAN

	text_origin: EV_COORDINATE

feature -- Conversion

	to_pixmap: EV_PIXMAP
		local
			pixel_buffer: EV_PIXEL_BUFFER
		do
			create pixel_buffer.make_with_pixmap (Current)
			create Result.make_with_pixel_buffer (pixel_buffer)
		end

feature {NONE} -- Type definitions

	Type_rendering_variable: TUPLE [code: STRING; value: INTEGER]
		once
		end

feature -- Constants

	Transparent_color: EL_COLOR
		once ("PROCESS")
			create Result.make_transparent
		end

feature {NONE} -- Constants

	Png_format: EV_PNG_FORMAT
		once
			create Result
		end

	Extension_png: STRING = "png"

	Initial_c: STRING = "c"

	Initial_h: STRING = "h"

	Initial_w: STRING = "w"

end
