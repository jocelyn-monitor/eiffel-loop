﻿note
	description: "Summary description for {MP3_FILE_COLLATOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-22 17:22:00 GMT (Friday 22nd May 2015)"
	revision: "6"

class
	MP3_FILE_COLLATOR

inherit
	EL_COMMAND

	EL_MODULE_LOG

	EL_MODULE_FILE_SYSTEM

	EL_MODULE_USER_INPUT

create
	make, default_create

feature {EL_COMMAND_LINE_SUB_APPLICATION} -- Initialization

	make (a_dir_path: like dir_path; a_is_dry_run: like is_dry_run)
		do
			is_dry_run := a_is_dry_run
			dir_path := a_dir_path
			create song_title_counts.make_equal (100)
		end

feature -- Basic operations

	execute
		local
			file_list: like File_system.file_list
			per_page: INTEGER
		do
			log.enter ("execute")
			per_page := 50
			if dir_path.exists then
				file_list := File_system.file_list (dir_path, "*.mp3")
				song_title_counts.accommodate (file_list.count)
				if is_dry_run then
					across file_list as mp3_path loop
						if mp3_path.cursor_index > per_page * 0 then
							relocate_mp3_file (mp3_path.item)
							if mp3_path.cursor_index \\ per_page = 0 then
								page := page + 1
								log_or_io.put_integer_field ("Page", page);
								log_or_io.put_new_line
								from until User_input.line ("Press return to continue").is_empty loop
									log_or_io.put_new_line
								end
								log_or_io.put_new_line
							end
						end
					end
				else
					across file_list as mp3_path loop
						relocate_mp3_file (mp3_path.item)
					end
				end
			end
			log.exit
		end

feature {NONE} -- Implementation

	dir_path: EL_DIR_PATH

	is_dry_run: BOOLEAN

	new_artist (id3_info: EL_ID3_INFO; mp3_path: EL_FILE_PATH): ASTRING
		local
			path, result_lower: ASTRING; found: BOOLEAN
		do
			Result := id3_info.artist
			if Result.is_empty then
				path := mp3_path.to_string
				Result := path
			end
			result_lower := Result.as_lower
			across Standard_artists_lower as artist until found loop
				if Result.count > artist.item.count
					and then result_lower.has_substring (artist.item)
					or else result_lower.has_substring (Standard_artist_words_lower.i_th (artist.cursor_index).last)
				then
					Result := Standard_artists [artist.cursor_index]
					found := True
				end
			end
			if Result = path then
				Result := Unknown
			end
			Result.left_adjust
		end

	new_genre (id3_info: EL_ID3_INFO): ASTRING
		do
			Result := id3_info.genre
			if Result.is_empty or else Tango_genres.has (Result) then
				Result := Tango

			elseif Result.starts_with (Prefix_argentine) then
				Result.remove_head (Prefix_argentine.count)

			elseif Result ~ Electronica then
				Result := "Tango (Electro)"

			end
		end

	new_title (id3_info: EL_ID3_INFO; mp3_path: EL_FILE_PATH): ASTRING
		do
			Result := id3_info.title
			if Result.is_empty then
				Result := mp3_path.without_extension.base
			end
			-- Remove numbers and other rubbish from start
			from until Result.is_empty or else Result.unicode_item (1).is_alpha loop
				Result.remove_head (1)
			end
			Result.replace_character ('_', ' ')
		end

	page: INTEGER

	relocate_mp3_file (mp3_path: EL_FILE_PATH)
		local
			id3_info: EL_ID3_INFO; destination_mp3_path: EL_FILE_PATH
			title_count: INTEGER; genre, artist, title: ASTRING
		do
			create id3_info.make_version (mp3_path, 2.4)
			genre := new_genre (id3_info)
			title := new_title (id3_info, mp3_path)
			artist := new_artist (id3_info, mp3_path)

			destination_mp3_path := dir_path.joined_file_steps (<< genre, artist, title >>)
			song_title_counts.search (destination_mp3_path)
			if song_title_counts.found then
				title_count := song_title_counts.found_item + 1
			else
				title_count := 1
			end
			song_title_counts [destination_mp3_path.twin] := title_count
			destination_mp3_path.add_extension (Double_digits.formatted (title_count))
			destination_mp3_path.add_extension ("mp3")

			if not is_dry_run then
				File_system.make_directory (destination_mp3_path.parent)
				File_system.move (mp3_path, destination_mp3_path)
				File_system.delete_empty_branch (mp3_path.parent)
			end

			log_or_io.put_path_field ("NEW", destination_mp3_path.relative_path (dir_path))
			log_or_io.put_new_line
			if title ~ Unknown or else artist ~ Unknown then
				log_or_io.put_path_field ("ORIGINAL", mp3_path.relative_path (dir_path))
				log_or_io.put_new_line
			end
		end

	song_title_counts: EL_HASH_TABLE [INTEGER, EL_FILE_PATH]

feature {NONE} -- Constants

	Double_digits: FORMAT_INTEGER
		once
			create Result.make (2)
			Result.zero_fill
		end

	Electronica: ASTRING
		once
			Result := "Electronica"
		end

	Prefix_argentine: ASTRING
		once
			Result := "Argentine "
		end

	Standard_artist_words_lower: ARRAYED_LIST [EL_ASTRING_LIST]
		once
			create Result.make (Standard_artists_lower.count)
			across Standard_artists_lower as name loop
				Result.extend (create {EL_ASTRING_LIST}.make_with_words (name.item))
			end
		end

	Standard_artists: ARRAY [ASTRING]
		once
			Result := <<
				"Alberto Moran",
				"An�l Troilo",
				"ngel D'Agostino",
				"Alfredo Gobbi",

				"Astor Piazzolla", -- Correct
				"Astor Piazzola",

				"Baffa-Berlingieri",
				"Carlos Di Sarli",
				"Edgardo Donato",
				"Francisco Canaro",
				"Juan D'Arienzo",
				"Jorge Dragone",
				"Lucio Demare",
				"Miguel Cal󢬍
				"Pedro Laurenz",
				"Osvaldo Pugliese",
				"Roberto Goyeneche",
				"Rodolfo Biagi"
			>>
		end

	Standard_artists_lower: ARRAYED_LIST [ASTRING]
		once
			create Result.make (Standard_artists.count)
			across Standard_artists as name loop
				Result.extend (name.item.as_lower)
			end
		end

	Tango: ASTRING
		once
			Result := "Tango"
		end

	Tango_genres: ARRAY [ASTRING]
		once
			Result := << "Latin", "(113)", "(4294967295)", "Traditional", "South/Central American" >>
			Result.compare_objects
		end

	Unknown: ASTRING
		once
			Result := "Unknown"
		end

end
