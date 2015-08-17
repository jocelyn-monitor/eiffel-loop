﻿note
	description: "Summary description for {EL_XML_NAME_SPACES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-30 12:12:45 GMT (Saturday 30th May 2015)"
	revision: "5"

class
	EL_XML_NAMESPACES

inherit
	EL_MODULE_STRING
		export
			{NONE} all
		end

	EL_MODULE_FILE_SYSTEM

create
	make, make_from_other, make_from_file

feature {NONE} -- Initaliazation

	make_from_file (file_name: EL_FILE_PATH)
			--
		do
			make (File_system.plain_text (file_name))
		end

	make_from_other (other: EL_XML_NAMESPACES)
		do
			namespace_urls := other.namespace_urls
		end

	make (xml: STRING)
			--
		local
			xmlns_intervals: EL_OCCURRENCE_SUBSTRINGS
			pos_double_quote: INTEGER
			declaration: ASTRING
			namespace_prefix_and_url: LIST [ASTRING]
		do
			create namespace_urls.make_equal (11)
			namespace_urls.compare_objects

			create xmlns_intervals.make (xml, "xmlns:")
			from xmlns_intervals.start until xmlns_intervals.after loop
				if xml.item (xmlns_intervals.interval.lower - 1).is_space then
					pos_double_quote := xml.index_of (Double_quote, xmlns_intervals.interval.upper + 1)
					pos_double_quote := xml.index_of (Double_quote, pos_double_quote + 1)

					declaration := xml.substring (xmlns_intervals.interval.upper + 1, pos_double_quote)
					namespace_prefix_and_url := declaration.split ('=')
					String.remove_bookends (namespace_prefix_and_url.last, "%"%"")
					namespace_urls.put (namespace_prefix_and_url.last, namespace_prefix_and_url.first)
				end

				xmlns_intervals.forth
			end
		end

feature -- Access

	namespace_urls: EL_ASTRING_HASH_TABLE [ASTRING]

feature {NONE} -- Constants

	Double_quote: CHARACTER = '"'

end
