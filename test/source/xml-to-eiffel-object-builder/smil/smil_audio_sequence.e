﻿note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 14:09:36 GMT (Wednesday 11th March 2015)"
	revision: "5"

class
	SMIL_AUDIO_SEQUENCE

inherit
	EL_EIF_OBJ_BUILDER_CONTEXT
		redefine
			make_default, building_action_table
		end

	EVOLICITY_EIFFEL_CONTEXT
		redefine
			make_default
		end

	EL_SMIL_VALUE_PARSING

	EL_MODULE_LOG

create
	make

feature {NONE} -- Initialization

	make_default
		do
			Precursor {EL_EIF_OBJ_BUILDER_CONTEXT}
			Precursor {EVOLICITY_EIFFEL_CONTEXT}
		end

	make
			--
		do
			make_default
			create audio_clip_list.make (7)
		end

feature -- Access

	audio_clip_list: ARRAYED_LIST [SMIL_AUDIO_CLIP]

	title: ASTRING

	id: INTEGER

feature {NONE} -- Evolicity fields

	getter_function_table: like getter_functions
			--
		do
			create Result.make (<<
				["id",					 agent: INTEGER_REF do Result := id.to_reference end],
				["title",				 agent: ASTRING do Result := title end],
				["audio_clip_list",	 agent: ITERABLE [SMIL_AUDIO_CLIP] do Result := audio_clip_list end]
			>>)
		end

feature {NONE} -- Build from XML

	extend_audio_clip_list
			--
		do
			log.enter ("extend_audio_clip_list")
			audio_clip_list.extend (create {SMIL_AUDIO_CLIP}.make)
			set_next_context (audio_clip_list.last)
			log.exit
		end

	building_action_table: like Type_building_actions
			-- Nodes relative to root element: smil
		do
			-- Call precursor to include xmlns attribute
			create Result.make (<<
				["@id", agent do id := node_as_integer_suffix end],
				["@title", agent do title := node.to_string end],
				["audio", agent extend_audio_clip_list]
			>>)
		end

end
