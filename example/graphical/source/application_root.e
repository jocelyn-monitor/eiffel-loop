note
	description: ""

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-12-11 14:32:12 GMT (Thursday 11th December 2014)"
	revision: "3"

class
	APPLICATION_ROOT

inherit
	EL_MULTI_APPLICATION_ROOT [BUILD_INFO]

create
	make

feature {NONE} -- Implementation

	Application_types: ARRAY [TYPE [EL_SUB_APPLICATION]]
			--
		once
			Result := <<
				{CONSOLE_LOGGING_QUANTUM_BALL_ANIMATION_APP},
				{DOCKING_APP},
				{QUANTUM_BALL_ANIMATION_APP},
				{POST_CARD_VIEWER_APP},
				{PANGO_CAIRO_TEST_APP}
			>>
		end

end
