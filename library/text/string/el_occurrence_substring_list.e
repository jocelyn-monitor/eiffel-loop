note
	description: "Summary description for {EL_STRING_OCCURRENCE_LIST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:29 GMT (Wednesday 11th March 2015)"
	revision: "4"

class
	EL_OCCURRENCE_SUBSTRING_LIST

inherit
	EL_SUBSTRINGS
		rename
			make as make_substrings
		undefine
			index_of, copy, is_equal, search, occurrences, has, off
		end

	LINKED_LIST [INTEGER_INTERVAL]
		rename
			make as make_list,
			item as interval
		end

create
	make

feature {NONE} -- Initialization

	make (a_string, search_string: ASTRING)
			--
		local
			l_occurrences: EL_OCCURRENCE_SUBSTRINGS
		do
			make_substrings (a_string)
			make_list
			create l_occurrences.make (a_string, search_string)
			from l_occurrences.start until l_occurrences.after loop
				extend (l_occurrences.interval.twin)
				l_occurrences.forth
			end
		end

end
