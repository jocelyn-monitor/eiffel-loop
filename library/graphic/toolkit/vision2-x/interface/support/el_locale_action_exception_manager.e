note
	description: "Summary description for {EL_LOCALE_ACTION_MANAGER}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-04-02 10:41:40 GMT (Wednesday 2nd April 2014)"
	revision: "2"

class
	EL_LOCALE_ACTION_EXCEPTION_MANAGER [D -> EL_ERROR_DIALOG create make end]

inherit
	EL_ACTION_EXCEPTION_MANAGER [D]
		redefine
			Default_title, Default_message
		end

	EL_MODULE_LOCALE

create
	make

feature {NONE} -- Constants

	Default_title: EL_ASTRING
		once
			Result := Locale * "ERROR"
		end

	Default_message: EL_ASTRING
		once
			Result := Locale * "{something bad happened}"
		end
end
