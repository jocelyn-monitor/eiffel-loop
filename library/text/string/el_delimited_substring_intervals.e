﻿note
	description: "Summary description for {EL_DELIMITED_SUBSTRINGS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-05-24 9:23:20 GMT (Sunday 24th May 2015)"
	revision: "4"

class
	EL_DELIMITED_SUBSTRING_INTERVALS

inherit
	EL_SUBSTRINGS
		rename
			make as make_substrings
		undefine
			do_all, do_if, for_all, there_exists, index_of, copy, is_equal, search, occurrences, has, off
		end

	ARRAYED_LIST [INTEGER_INTERVAL]
		rename
			make as make_list,
			item as interval
		end

create
	make

feature {NONE} -- Initialization

	make (a_string, delimiter: ASTRING)
			--
		local
			delimiter_substrings: EL_OCCURRENCE_SUBSTRING_LIST
			last_occurence: INTEGER_INTERVAL
		do
			make_substrings (a_string)
			create delimiter_substrings.make (a_string, delimiter)
			make_list (delimiter_substrings.count)

			create last_occurence.make (1, 0)
			delimiter_substrings.start
			if delimiter_substrings.after then
				extend (1 |..| string.count)
			else
				from until delimiter_substrings.after loop
					extend ((last_occurence.upper + 1) |..| (delimiter_substrings.interval.lower - 1))
					last_occurence := delimiter_substrings.interval
					delimiter_substrings.forth
				end
				extend ((last_occurence.upper + 1) |..| string.count)
			end
		end

feature -- Access

	substrings: EL_ARRAYED_LIST [ASTRING]
			-- string delimited list
		do
			create Result.make (count)
			from start until after loop
				Result.extend (substring)
				forth
			end
		end

end
