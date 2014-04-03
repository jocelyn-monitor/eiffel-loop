note
	description: "Summary description for {RBOX_EXPORT_APPLICATION}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-10-27 12:23:17 GMT (Sunday 27th October 2013)"
	revision: "3"

deferred class
	RBOX_EXPORT_APPLICATION

inherit
	RBOX_APPLICATION
		redefine
			normal_initialize
		end

feature {NONE} -- Initialization

	normal_initialize
			--
		do
			Precursor

			create id3_export
			id3_export.set_item (2.3)
			set_attribute_from_command_opt (id3_export, "id3_export", "id3 version to use for exporting operations")

			export_path := Directory.home.joined_dir_path ("Desktop/Music")
			set_attribute_from_command_opt (export_path, "destination", Destination_description)
		end

feature -- Basic operations

	normal_run
			--
		do
			create_database
			create device.make (export_path, database, id3_export)

			if database.is_initialized then
				do_export
			end
		end

	do_export
		deferred
		end

feature {NONE} -- Implementation

	device: MP3_DEVICE
		-- Export target device

	id3_export: REAL_REF

	export_path: EL_DIR_PATH

	destination_description: STRING
		deferred
		end

end
