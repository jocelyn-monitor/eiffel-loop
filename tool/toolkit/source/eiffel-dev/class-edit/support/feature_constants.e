note
	description: "Summary description for {FEATURE_CONSTANTS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-01-14 11:28:41 GMT (Wednesday 14th January 2015)"
	revision: "4"

class
	FEATURE_CONSTANTS

feature {NONE} -- Constants

	Feature_catagories: EL_ASTRING_HASH_TABLE [STRING]
		once
			create Result.make (<<
				["ac", 	"Access"],
				["at", 	"Attributes"],
				["aa", 	"Access attributes"],
				["bo", 	"Basic operations"],
				["co", 	"Constants"],
				["cp", 	"Comparison"],
				["cs", 	"Contract Support"],
				["cv", 	"Conversion"],
				["cm", 	"Cursor movement"],
				["dm", 	"Dimensions"],
				["dp", 	"Disposal"],
				["du", 	"Duplication"],
				["ec", 	"Element change"],
				["er", 	"Evolicity reflection"],
				["ev", 	"Event handling"],
				["fa", 	"Factory"],
				["im", 	"Implementation"],
				["ip", 	"Inapplicable"],
				["ia", 	"Internal attributes"],
				["in", 	"Initialization"],
				["me", 	"Measurement"],
				["mi",	"Miscellaneous"],
				["ob", 	"Obsolete"],
				["rm", 	"Removal"],
				["rs", 	"Resizing"],
				["sc", 	"Status change"],
				["sq", 	"Status query"],
				["sr", 	"Status report"],
				["td", 	"Type definitions"],
				["tf", 	"Transformation"],
				["un", 	"Unimplemented"]
			>>)
		end

end
