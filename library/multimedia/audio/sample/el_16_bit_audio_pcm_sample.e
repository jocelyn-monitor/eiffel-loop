﻿note
	description: ""

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:36 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	EL_16_BIT_AUDIO_PCM_SAMPLE

inherit
	EL_AUDIO_PCM_SAMPLE
		rename
			Integer_16_bytes as Bytes
		end

create
	make

feature {NONE} -- Implementation

	read_value: INTEGER
			--
		do
			Result := read_integer_16_le (0)
		end

	put_value (a_value: like value)
			--
		do
			-- Windows wave is little endian
			put_integer_16_le (a_value.to_integer_16, 0)
		end

feature -- Constants

	Max_value: INTEGER_64
			--
		local
			l_value: INTEGER_16
		once
			Result := (l_value.Max_value).to_integer_64 + 1
		end

	Min_value: INTEGER
			--
		local
			l_value: INTEGER_16
		once
			Result := l_value.Min_value
		end

	Bias: INTEGER = 0

end
