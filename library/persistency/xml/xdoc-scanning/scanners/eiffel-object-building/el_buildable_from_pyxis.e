note
	description: "Summary description for {EL_BUILDABLE_FROM_PYXIS}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-08-02 12:25:19 GMT (Friday 2nd August 2013)"
	revision: "2"

deferred class
	EL_BUILDABLE_FROM_PYXIS

inherit
	EL_BUILDABLE_FROM_XML
		rename
			make_default as make
		redefine
			Builder
		end

feature {NONE} -- Globals

	Builder: EL_XML_TO_EIFFEL_OBJECT_BUILDER
			--
		once
			create Result.make_pyxis_source
		end

end
