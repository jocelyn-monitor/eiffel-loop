note
	description: "Summary description for {MARKUP_LINE_COUNTER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-03-11 14:06:09 GMT (Wednesday 11th March 2015)"
	revision: "4"

class
	MARKUP_LINE_COUNTER

feature -- Measurement

	line_ends_with_count (a_file_path: EL_FILE_PATH; tag: ASTRING): INTEGER
			-- Build object from xml file
		local
			lines: EL_FILE_LINE_SOURCE
		do
			create lines.make (a_file_path)
			from lines.start until lines.after loop
				if lines.item.ends_with (tag) then
					Result := Result + 1
				end
				lines.forth
			end
		end

end
