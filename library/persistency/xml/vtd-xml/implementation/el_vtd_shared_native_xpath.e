note
	description: "Summary description for {EL_VTD_SHARED_NATIVE_XPATH}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-02-24 17:38:02 GMT (Monday 24th February 2014)"
	revision: "2"

class
	EL_VTD_SHARED_NATIVE_XPATH

feature {NONE} -- Implementation

	native_xpath (a_xpath: STRING_32): EL_VTD_NATIVE_XPATH
		do
			Result := Internal_native_xpath
			Result.share_area (a_xpath)
		end

feature {NONE} -- Constants

	Internal_native_xpath: EL_VTD_NATIVE_XPATH
		once
			create Result.make
		end

end
