note
	description: "Summary description for {EL_PASS_PHRASE}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-04-27 10:11:59 GMT (Monday 27th April 2015)"
	revision: "4"

class
	EL_LOCALE_PASS_PHRASE

inherit
	EL_PASS_PHRASE
		
		redefine
			password_strength, Security_description_template
		end

	EL_MODULE_LOCALE
		undefine
			out, copy, is_equal
		end

create
	make, make_default

feature -- Access

	password_strength: ASTRING
		do
			Result := Locale * English_password_strengths [security_score]
		end

feature {NONE} -- Constants

	Security_description_template: ASTRING
		once
			Result := Locale * "{security-description-template}"
		end

end
