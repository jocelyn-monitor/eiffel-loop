﻿note
	description: "Summary description for {EL_PATH}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-07-01 10:40:55 GMT (Wednesday 1st July 2015)"
	revision: "7"

deferred class
	EL_PATH

inherit
	HASHABLE
		redefine
			is_equal, default_create, out, copy
		end

	EL_MODULE_DIRECTORY
		undefine
			is_equal, default_create, out, copy
		end

	COMPARABLE
		undefine
			is_equal, default_create, out, copy
		end

	EL_MODULE_FILE_SYSTEM
		export
			{NONE} all
		undefine
			is_equal, default_create, out, copy
		end

	EL_PATH_CONSTANTS
		export
			{NONE} all
		undefine
			is_equal, default_create, out, copy
		end

feature {NONE} -- Initialization

	default_create
		do
			parent_path := Empty_path; base := Empty_path
			escaper := Default_escaper
		end

	make_from_unicode, make_from_latin1 (a_unicode_path: READABLE_STRING_GENERAL)
		do
			make (create {ASTRING}.make_from_unicode (a_unicode_path))
		end

	make_from_path (a_path: PATH)
		do
			make_from_unicode (a_path.name)
		end

	make_from_other (other: EL_PATH)
		do
			base := other.base.twin
			parent_path := other.parent_path.twin
			is_absolute := other.is_absolute
			escaper := other.escaper
		end

feature -- Initialization

	make, set_path (a_path: ASTRING)
			--
		local
			pos_last_separator: INTEGER
			norm_path: ASTRING
		do
			default_create

			-- Normalize path
			if not is_uri and then {PLATFORM}.is_windows and then not a_path.has (Separator) then
				norm_path := a_path.twin
				norm_path.replace_character (Unix_separator, Separator)
			else
				norm_path := a_path
			end

			if not norm_path.is_empty then
				pos_last_separator := norm_path.last_index_of (Separator, norm_path.count)
				if pos_last_separator = 0 then
					if {PLATFORM}.is_windows then
						pos_last_separator := norm_path.last_index_of (':', norm_path.count)
					end
				end
			end

			set_parent_path (norm_path.substring (1, pos_last_separator))
			base := norm_path.substring (pos_last_separator + 1, norm_path.count)
			is_absolute := is_path_absolute (norm_path)
		ensure
			escaper_attached: attached {EL_CHARACTER_ESCAPER} escaper
		end

feature -- Access

	extension: ASTRING
			--
		do
			if base.has ('.') then
				Result := base.substring (base.last_index_of ('.', base.count) + 1, base.count)
			else
				create Result.make_empty
			end
		end

	base: ASTRING

	steps: EL_PATH_STEPS
			--
		do
			create Result.make (to_string)
		end

	parent: like Type_parent
		do
			if has_parent then
				create Result.make_from_other (Current)
				Result.remove_base
			else
				create Result
			end
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := internal_hash_code
			if Result = 0 then
				Result := combined_hash_code (<< parent_path, base >>)
				internal_hash_code := Result
			end
		end

feature -- Status Query

	exists: BOOLEAN
		deferred
		end

	has_parent: BOOLEAN
		local
			parent_count: INTEGER
		do
			parent_count := parent_path.count
			if is_absolute then
				Result := not base.is_empty and then parent_count >= 1 and then parent_path [parent_count] = Separator
			else
				Result := not parent_path.is_empty and then parent_path [parent_count] = Separator
			end
		end

	is_absolute: BOOLEAN

	is_directory: BOOLEAN
		deferred
		end

	is_file: BOOLEAN
		do
			Result := not is_directory
		end

	is_uri: BOOLEAN
		do
		end

	is_empty: BOOLEAN
		do
			Result := parent_path.is_empty and base.is_empty
		end

	is_valid_on_ntfs: BOOLEAN
			-- True if path is valid on Windows NT file system
		local
			i: INTEGER; l_characters: like Invalid_ntfs_characters_32
			uc: CHARACTER_32; found: BOOLEAN
		do
			l_characters := Invalid_ntfs_characters_32
			from i := 1 until found or i > l_characters.count loop
				uc := l_characters [i]
				if not ({PLATFORM}.is_unix and uc = '/') then
					found := base.has (uc) or else parent_path.has (uc)
				end
				i := i + 1
			end
			Result := not found
		end

	out_abbreviated: BOOLEAN
		-- is the current directory in 'out string' abbreviated to $CWD

feature -- Status change

	enable_out_abbreviation
		do
			out_abbreviated := True
		end

	set_relative
		do
			is_absolute := False
		end

feature -- Element change

	append_file_path (a_file_path: EL_FILE_PATH)
		require
			current_not_a_file: not is_file
		do
			if not a_file_path.is_empty then
				append (a_file_path)
			end
		end

	append_dir_path (a_dir_path: EL_DIR_PATH)
		do
			if not a_dir_path.is_empty then
				append (a_dir_path)
			end
		end

	add_extension (a_extension: ASTRING)
		local
			l_base: ASTRING
		do
			create l_base.make (base.count + a_extension.count + 1)
			l_base.append (base); l_base.append_character ('.'); l_base.append (a_extension)
			base := l_base
		end

	change_to_unix
		do
			if {PLATFORM}.is_windows then
				parent_path.replace_character (Windows_separator, Unix_separator)
			end
		end

	change_to_windows
		do
			if not {PLATFORM}.is_windows then
				parent_path.replace_character (Unix_separator, Windows_separator)
			end
		end

	expand
			-- expand an environment variables
		do
			if is_potenially_expandable (parent) or else is_potenially_expandable (base) then
				set_path (steps.expanded_path.to_string)
			end
		end

	rename_base (new_name: ASTRING; preserve_extension: BOOLEAN)
			-- set new base to new_name, preserving extension if preserve_extension is True
		local
			l_extension: like extension
		do
			l_extension := extension
			set_base (new_name)
			if preserve_extension and then l_extension /~ extension then
				add_extension (l_extension)
			end
		end

	replace_extension (a_replacement: ASTRING)
		do
			remove_extension
			add_extension (a_replacement)
		end

	set_parent_path (a_parent: ASTRING)
		local
			l_parent_set: like Parent_set
		do
			if a_parent.is_empty then
				parent_path := a_parent
			else
				l_parent_set := Parent_set
				l_parent_set.search (a_parent)
				if l_parent_set.found then
					parent_path := l_parent_set.found_item
				else
					l_parent_set.force_new (a_parent)
					parent_path := a_parent
				end
			end
		end

	set_base (a_base: like base)
		do
			base := a_base
		end

	set_escaper (a_escaper: like escaper)
		do
			escaper := a_escaper
		end

	set_default_escaper
		do
			escaper := Default_escaper
		end

	share (other: like Current)
		do
			base := other.base
			parent_path := other.parent_path
			is_absolute := other.is_absolute
		end

	translate (originals, substitutions: ASTRING)
		do
			base.translate (originals, substitutions)
			parent_path.translate (originals, substitutions)
		end

feature -- Removal

	remove_extension
		do
			base.remove_tail (base.count - base.last_index_of ('.', base.count) + 1 )
		end

	wipe_out
		do
			parent_path.wipe_out; base.wipe_out
		end

feature -- Conversion

	expanded_path: like Current
		do
			Result := twin
			Result.expand
		end

	to_escaped_string: ASTRING
			-- returns strings escaped with currently set escaper.
			-- The default escaper does nothing
		do
			Result := to_string
			if escaper /= Default_escaper then
				Result.escape (escaper)
			end
		end

	to_string: ASTRING
			--
		do
			create Result.make (parent_path.count + base.count)
			Result.append (parent_path)
			Result.append (base)
		end

	to_path: PATH
		do
			create Result.make_from_string (unicode)
		end

	unicode: STRING_32
		do
			Result := to_string.to_unicode
		end

	relative_path (a_parent: EL_DIR_PATH): like new_relative_path
		require
			parent_is_parent: a_parent.is_parent_of (Current)
		do
			Result := new_relative_path
			Result.parent_path.remove_head (a_parent.parent_path.count + a_parent.base.count + 1)
			Result.set_relative
		end

	out: STRING
		local
			l_out: like to_string
		do
			l_out := to_string
			if out_abbreviated then
				-- Replaces String.abbreviate_working_directory
				l_out.replace_substring_all (Directory.current_working.to_string, "$CWD")
			end
			Result := l_out
		end

	to_unix, as_unix: like Current
		do
			Result := twin
			Result.change_to_unix
		end

	to_windows, as_windows: like Current
		do
			Result := twin
			Result.change_to_windows
		end

	translated (originals, substitutions: ASTRING): like Current
		do
			Result := twin
			Result.translate (originals, substitutions)
		end

	without_extension: like Current
		do
			Result := twin
			Result.remove_extension
		end

	with_new_extension (a_new_ext: ASTRING): like Current
		do
			Result := twin
			Result.replace_extension (a_new_ext)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			--
		do
			Result := base.is_equal (other.base) and parent_path.is_equal (other.parent_path)
		end

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			if parent_path ~ other.parent_path then
				Result := base < other.base
			else
				Result := parent_path < other.parent_path
			end
		end

feature -- Duplication

	copy (other: like Current)
		do
			make_from_other (other)
		end

feature -- Contract Support

	is_path_absolute (a_path: ASTRING): BOOLEAN
		do
			if {PLATFORM}.is_windows then
				Result := a_path.count >= 3 and then a_path [2] = ':' and then a_path [3] = Separator
			else
				Result := not a_path.is_empty and then a_path [1] = Separator
			end
		end

feature {EL_PATH} -- Implementation

	append (a_path: EL_PATH)
		require
			relative_path: not a_path.is_absolute
		local
			l_parent: ASTRING
		do
			create l_parent.make (parent_path.count + base.count + parent_path.count + 2)
			l_parent.append (parent_path)
			l_parent.append (base)
			if not base.is_empty then
				l_parent.append_unicode (Separator.natural_32_code)
			end
			if not a_path.parent_path.is_empty then
				l_parent.append (a_path.parent_path)
			end
			set_parent_path (l_parent)
			base := a_path.base
		end

	parent_path: ASTRING

feature {EL_PATH} -- Implementation

	combined_hash_code (strings: ARRAY [like base]): INTEGER
		local
			i, nb: INTEGER
			l_area: like base.area
		do
			across strings as string loop
				l_area := string.item.area
				nb := string.item.count
				from i := 0 until i = nb loop
					Result := ((Result \\ Magic_number) |<< 8) + l_area.item (i).code
					i := i + 1
				end
			end
		end

	is_potenially_expandable (a_path: ASTRING): BOOLEAN
		local
			pos_dollor: INTEGER
		do
			pos_dollor := a_path.index_of ('$', 1)
			Result := pos_dollor > 0 and then (pos_dollor = 1 or else a_path [pos_dollor - 1] = Separator)
		end

	parent_set: DS_HASH_SET [ASTRING]
			--
		once
			create Result.make_equal (100)
		end

	remove_base
		require
			has_parent: has_parent
		local
			pos_separator, pos_last_separator: INTEGER
		do
			pos_last_separator := parent_path.count
			if pos_last_separator = 1 then
				base.wipe_out
			else
				pos_separator := parent_path.last_index_of (Separator, pos_last_separator - 1)
				base := parent_path.substring (pos_separator + 1, pos_last_separator - 1)
				set_parent_path (parent_path.substring (1, pos_separator))
			end
		end

	new_relative_path: EL_PATH
		deferred
		end

	internal_hash_code: INTEGER

	escaper: EL_CHARACTER_ESCAPER

feature {NONE} -- Type definitions

	Type_parent: EL_DIR_PATH
		require
			never_called: False
		once
		end

feature -- Constants

	Unix_separator: CHARACTER_32 = '/'

	Windows_separator: CHARACTER_32 = '\'

feature {NONE} -- Constants

	Magic_number: INTEGER = 8388593

	Default_escaper: EL_DO_NOTHING_CHARACTER_ESCAPER
		once
			create Result
		end

	Forward_slash: ASTRING
		once
			Result := "/"
		end

	Empty_path: ASTRING
		once
			create Result.make_empty
		end
		-- Greatest prime lower than 2^23
		-- so that this magic number shifted to the left does not exceed 2^31.

	Separator: CHARACTER_32
		once
			Result := Operating_environment.Directory_separator
		end

end
