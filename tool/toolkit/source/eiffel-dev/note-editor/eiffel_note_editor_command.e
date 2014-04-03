note
	description: "Edits notes in sources specified by manifest"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-02-22 10:03:35 GMT (Saturday 22nd February 2014)"
	revision: "4"

class
	EIFFEL_NOTE_EDITOR_COMMAND

inherit
	EIFFEL_SOURCE_MANIFEST_EDITOR_COMMAND
		rename
			make as make_editor
		end

create
	make, default_create

feature {EL_TESTABLE_COMMAND_LINE_SUB_APPLICATTION} -- Initialization

	make (source_manifest_path, license_notes_path: EL_FILE_PATH)

		do
			log.enter_with_args ("make", << source_manifest_path >>)
			create license_notes.make_from_file (license_notes_path)
			make_editor (source_manifest_path)
			log.exit
		end

feature {NONE} -- Implementation

	create_file_editor: EIFFEL_NOTE_EDITOR
		do
			create Result.make (license_notes)
		end

	license_notes: LICENSE_NOTES

end
