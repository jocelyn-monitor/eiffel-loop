﻿note
	description: "Summary description for {EL_SHARED_PAYPAL_VARIABLES}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-04-28 12:59:02 GMT (Tuesday 28th April 2015)"
	revision: "5"

class
	EL_SHARED_PAYPAL_VARIABLES

feature {NONE} -- Constants

	Variable: TUPLE [
		acknowledge,
		button_code, button_country, button_language, button_status, button_sub_type, button_type,
		hosted_button_id, notify_url, version, website_code: ASTRING
	]
		once
			create Result
			Result.acknowledge := "ACK"

			Result.button_code := "BUTTONCODE"
			Result.button_country := "BUTTONCOUNTRY"
			Result.button_language := "BUTTONLANGUAGE"
			Result.button_type := "BUTTONTYPE"
			Result.button_status := "BUTTONSTATUS"
			Result.button_sub_type := "BUTTONSUBTYPE"

			Result.hosted_button_id := "HOSTEDBUTTONID"
			Result.notify_url := "NOTIFYURL"
			Result.version := "VERSION"
			Result.website_code := "WEBSITECODE"
		end

end
