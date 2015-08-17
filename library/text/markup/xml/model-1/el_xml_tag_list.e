note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-06-02 8:24:01 GMT (Tuesday 2nd June 2015)"
	revision: "3"

class
	EL_XML_TAG_LIST

inherit
	LINKED_LIST [ASTRING]
		rename
			make as make_list
		export
			{NONE} all
			{ANY} do_all, count, start, item
		redefine
			default_create
		end

	EL_MODULE_XML
		export
			{NONE} all
		undefine
			copy, is_equal, default_create
		end

	EL_SERIALIZEABLE_AS_XML
		undefine
			copy, is_equal, default_create
		end

create
	default_create

feature {NONE} -- Initialization

	default_create
			--
		do
			make_list
		end

	make (tag_name: STRING)
			--
		do
			make_list
			extend (XML.open_tag (tag_name))
			if new_line_after_open_tag then
				last.append_character ('%N')
			end
			extend (XML.closed_tag (tag_name))
			last.append_character ('%N')
		end

	make_from_other (other: EL_XML_TAG_LIST)
			--
		do
			make_list
			other.do_all (agent extend)
		end

feature -- Element change

	append_tags (tags: EL_XML_TAG_LIST)
			--
		do
			tags.do_all (agent extend)
		end

feature -- Conversion

	to_string, to_xml: ASTRING
			--
		do
			Buffer.clear_all
			do_all (agent append_to_buffer)
			Result := Buffer.string
		end

	to_utf_8_xml: STRING
		do
			Result := to_xml.to_utf8
		end

feature {NONE} -- Implementation

	append_to_buffer (s: ASTRING)
			--
		do
			Buffer.append_string (s)
		end

	new_line_after_open_tag: BOOLEAN
			--
		do
		end

	Buffer: ASTRING
			--
		once
			create Result.make (256)
		end

end

