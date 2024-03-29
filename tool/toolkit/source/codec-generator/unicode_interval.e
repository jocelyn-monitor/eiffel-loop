﻿note
	description: "Summary description for {UNICODE_INTERVAL}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:47:40 GMT (Wednesday 11th March 2015)"
	revision: "8"

class
	UNICODE_INTERVAL

inherit
	INTEGER_INTERVAL
		rename
			make as make_interval
		end

	EVOLICITY_EIFFEL_CONTEXT
		undefine
			is_equal, copy
		redefine
			make_default
		end

	COMPARABLE
		undefine
			is_equal, copy
		end

create
	make

convert
	make ({INTEGER_INTERVAL})

feature {NONE} -- Initialization

	make_default
		do
			create latin_characters.make (7)
			Precursor
		end

	make (a_interval: INTEGER_INTERVAL)
		do
			make_interval (a_interval.lower, a_interval.upper)
			make_default
		end

feature -- Access

	latin_characters: ARRAYED_LIST [LATIN_CHARACTER]

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := count > other.count
		end

feature -- Status query


feature -- Element change

	extend_latin (c: LATIN_CHARACTER)
		do
			latin_characters.extend (c)
		end

feature {NONE} -- Implementation

	character (code: NATURAL): ASTRING
		do
			create Result.make (1)
			Result.append_unicode (code)
		end

feature {NONE} -- Evolicity fields

	getter_function_table: like getter_functions
			--
		do
			create Result.make (<<
				["lower_character", agent: ASTRING do Result := character (lower.to_natural_32) end ],
				["upper_character", agent: ASTRING do Result := character (upper.to_natural_32) end ],
				["first_latin_character", agent: LATIN_CHARACTER do Result := latin_characters.first end],
				["latin_characters", agent: ITERABLE [LATIN_CHARACTER] do Result := latin_characters end]
			>>)
		end

end
