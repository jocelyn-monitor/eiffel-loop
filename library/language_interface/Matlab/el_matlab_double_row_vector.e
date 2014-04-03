note
	description: "Objects that ..."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2012 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2012-12-16 11:34:28 GMT (Sunday 16th December 2012)"
	revision: "1"

class
	EL_MATLAB_DOUBLE_ROW_VECTOR

inherit
	EL_MATLAB_VECTOR_DOUBLE

create
	share_from_pointer, make, make_from_mx_pointer

feature -- Contract support

	is_orientation_valid (mx_matrix: POINTER): BOOLEAN
			--
		do
			Result := c_get_rows (mx_matrix) = 1
		end

feature {NONE} -- Implementation

	create_matrix (size: INTEGER): POINTER
			--
		do
			Result := c_create_double_matrix (1, size)
		end

	mx_count: INTEGER
			--
		do
			Result := c_get_columns (item)
		end

end
