note
	description: "Summary description for {EL_SUBSTRINGS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 13:54:28 GMT (Wednesday 11th March 2015)"
	revision: "4"

deferred class
	EL_SUBSTRINGS

inherit
	LINEAR [INTEGER_INTERVAL]
		rename
			item as interval
		end

feature {NONE} -- Initialization

	make (a_string: ASTRING)
			--
		do
			create string.make_empty
			string.share (a_string)
		end

feature -- Access

	string: ASTRING

	substring: ASTRING
			--
		do
			Result := string.substring (interval.lower, interval.upper)
		end

end
