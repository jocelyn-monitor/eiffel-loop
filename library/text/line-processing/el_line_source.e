﻿note
	description: "${description}"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:28 GMT (Wednesday 11th March 2015)"
	revision: "6"

deferred class
	EL_LINE_SOURCE [F -> FILE]

inherit
	EL_LINEAR [ASTRING]
		redefine
			default_create
		end

	ITERABLE [ASTRING]
		undefine
			default_create
		end

	EL_ENCODEABLE_AS_TEXT
		undefine
			default_create
		redefine
			set_encoding
		end

	EL_SHARED_CODEC_FACTORY
		undefine
			default_create
		end

	EL_MODULE_UTF
		undefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			--
		do
			create item.make_empty
			set_utf_encoding (8)
		end

	make (a_source: F)
		do
			default_create
			source := a_source
			is_source_external := True
		end

feature -- Access

	item: ASTRING

	index: INTEGER

	count: INTEGER

	joined: ASTRING
		do
			create Result.make (source.count)
			from start until after loop
				if index > 1 then
					Result.append_character ('%N')
				end
				Result.append (item)
				forth
			end
		end

	new_cursor: EL_LINE_SOURCE_ITERATION_CURSOR [F]
			--
		do
			create Result.make (Current)
			Result.start
		end

feature -- Status query

	is_open: BOOLEAN
			--
		do
			Result := source.is_open_read
		end

	after: BOOLEAN
			-- Is there no valid position to the right of current one?
		do
			Result := index = count + 1
		end

	is_empty: BOOLEAN
			-- Is there no element?
		do
			Result := source.is_empty
		end

	is_source_external: BOOLEAN
		-- True if source is managed externally to object

feature -- Conversion

	list: EL_ASTRING_LIST
			--
		do
			create Result.make_empty
			from start until after loop
				Result.extend (item)
				forth
			end
		end

feature -- Cursor movement

	start
			-- Move to first position if any.
		do
			if not source.is_open_read then
				source.open_read
			else
				source.go (0)
			end
			if source.count >= 3 then
				source.read_stream (3)
				if source.last_string ~ UTF.Utf_8_bom_to_string_8 then
					set_utf_encoding (8)
				else
					source.go (0)
				end
			end
			count := 0
			if source.off then
				index := 1
				create item.make_empty
			else
				index := 0
				forth
			end
		end

	forth
			-- Move to next position
		require else
			file_is_open: is_open
		do
			if source.end_of_file then
				if not is_source_external then
					source.close
				end
			else
				item := next_line (source)
				count := count + 1
			end
			index := index + 1
		end

feature -- Element change

	set_encoding (a_type: like encoding_type; a_encoding: like encoding)
			--
		do
			Precursor (a_type, a_encoding)
			if encoding_type = Encoding_ISO_8859 then
				create {EL_ENCODED_LINE_READER [F]} decoder.make (new_iso_8859_codec (encoding))

			elseif encoding_type = Encoding_windows then
				create {EL_ENCODED_LINE_READER [F]} decoder.make (new_windows_codec (encoding))

			elseif encoding_type = Encoding_utf then
				if encoding = 8 then
					create {EL_UTF_8_ENCODED_LINE_READER [F]} decoder

				end
			end
		end

feature -- Status setting

	close
			--
		do
			if source.is_open_read then
				source.close
			end
		end

feature {NONE} -- Unused

	finish
			-- Move to last position.
		do
		end

feature {EL_LINE_SOURCE_ITERATION_CURSOR} -- Implementation

	next_line (a_source: F): ASTRING
		do
			decoder.set_line_from_file (a_source)
			Result := decoder.line
		end

	decoder: EL_LINE_READER [F]

	source: F

end
