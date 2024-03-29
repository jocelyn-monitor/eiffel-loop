﻿note
	description: "Summary description for {EL_BASE_64}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:34:35 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	EL_BASE_64_ROUTINES

inherit
	EL_MODULE_STRING

feature -- Conversion

	encoded (a_string: STRING): STRING
		do
			Result := encoded_special (String.to_code_array (a_string))
		end

	encoded_special (array: SPECIAL [NATURAL_8]): STRING
			--
		local
			out_stream: KL_STRING_OUTPUT_STREAM
			encoder: UT_BASE64_ENCODING_OUTPUT_STREAM
			data_string: STRING
		do
			create data_string.make_filled ('%/0/', array.count)
			data_string.area.base_address.memory_copy (array.base_address, array.count)

			create out_stream.make_empty
			create encoder.make (out_stream, False, False)
			encoder.put_string (data_string)
			encoder.close
			Result := out_stream.string
--		ensure
--			reversable: array ~ decoded_array (Result).area
		end

	joined (base64_lines: STRING): STRING
			-- base64 string with all newlines removed.
			-- Useful for manifest constants of type "[
			-- ]"
		do
			Result := base64_lines.twin
			base64_lines.prune_all ('%N')
		end

	decoded (base64_string: STRING): STRING
			--
		local
			decoder: UT_BASE64_DECODING_INPUT_STREAM
			input_stream: KL_STRING_INPUT_STREAM
		do
			create input_stream.make (base64_string)
			create decoder.make (input_stream)
			decoder.read_string (base64_string.count)
			Result := decoder.last_string
		end

	decoded_array (base64_string: STRING): ARRAY [NATURAL_8]
			--
		local
			plain: STRING
		do
			plain := decoded (base64_string)
			create Result.make (1, plain.count)
			Result.area.base_address.memory_copy (plain.area.base_address, plain.count)
		end

end
