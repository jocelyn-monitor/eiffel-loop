note
	description: "Summary description for {EL_PYTHON_ESCAPE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-18 11:18:52 GMT (Thursday 18th December 2014)"
	revision: "4"

class
	EL_PYTHON_UNESCAPE_CONSTANTS

feature {NONE} -- Constants

	Escape_character: CHARACTER_32 = '\'

	Double_quote_escape_table: EL_HASH_TABLE [CHARACTER_32, CHARACTER_32]
		once
			create Result.make (Basic_escape_tuples)
			Result ['"'] := '"'
		end

	Single_quote_escape_table: EL_HASH_TABLE [CHARACTER_32, CHARACTER_32]
		once
			create Result.make (Basic_escape_tuples)
			Result ['%''] := '%''
		end

	Basic_escape_tuples: ARRAY [TUPLE [CHARACTER_32, CHARACTER_32]]
		once
			Result := <<
				[Escape_character, Escape_character],
				[{CHARACTER_32}'n', {CHARACTER_32}'%N'],
				[{CHARACTER_32}'t', {CHARACTER_32}'%T']
			>>
		end

end
