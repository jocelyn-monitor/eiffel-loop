﻿note
	description: "Summary description for {TASK_CONSTANTS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-02-08 17:09:23 GMT (Sunday 8th February 2015)"
	revision: "5"

class
	TASK_CONSTANTS

feature {NONE} -- Constants

	Task_add_album_art: STRING = "add_album_art"

	Task_collate_songs: STRING = "collate_songs"

	Task_delete_comments: STRING = "delete_comments"

	Task_export_dj_events: STRING = "export_dj_events"

	Task_export_music_to_device: STRING = "export_music_to_device"

	Task_export_playlists_to_device: STRING = "export_playlists_to_device"

	Task_import_videos: STRING = "import_videos"

	Task_normalize_comments: STRING = "normalize_comments"

	Task_print_comments: STRING = "print_comments"

	Task_publish_dj_events: STRING = "publish_dj_events"

	Task_relocate_songs: STRING = "relocate_songs"

	Task_remove_all_ufids: STRING = "remove_all_ufids"

	Task_replace_songs: STRING = "replace_songs"

	Task_replace_cortina_set: STRING = "replace_cortina_set"

	Task_rewrite_incomplete_id3_info: STRING = "rewrite_incomplete_id3_info"

	Task_remove_unknown_album_pictures: STRING = "remove_unknown_album_pictures"

	Task_update_comments_with_album_artists: STRING = "update_comments_with_album_artists"

	Playlist_changing_tasks: ARRAY [STRING]
			-- Task that cause contents of playlists to change
		once
			Result := << task_replace_songs, Task_replace_cortina_set, Task_collate_songs >>
		end

end
