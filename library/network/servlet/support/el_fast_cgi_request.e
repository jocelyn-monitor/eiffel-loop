﻿note
	description: "Summary description for {EL_FAST_CGI_REQUEST}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-04-29 15:12:21 GMT (Wednesday 29th April 2015)"
	revision: "6"

class
	EL_FAST_CGI_REQUEST

inherit
	GOA_FAST_CGI_REQUEST
		redefine
			make, end_request
		end

	GOA_CGI_VARIABLES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialization

	make
		do
			Precursor
			end_request_action := agent do_nothing
		end

feature -- Access

	path_info: ASTRING
		do
			create Result.make_from_utf8 (parameters.item (Path_info_var))
			Result.prune_all_leading ('/')
		end

feature -- Element change

	set_end_request_action (a_end_request_action: like end_request_action)
		do
			end_request_action := a_end_request_action
		end

feature {NONE} -- Implementation

	end_request
		do
			Precursor
			if write_ok then
				end_request_action.apply
				end_request_action := agent do_nothing
			end
		end

	end_request_action: PROCEDURE [ANY, TUPLE]
		-- action called on successful write of servlet response

end
