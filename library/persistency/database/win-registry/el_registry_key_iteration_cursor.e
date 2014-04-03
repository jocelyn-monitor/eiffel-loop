note
	description: "Summary description for {EL_REGISTRY_KEY_ITERATION_CURSOR}."

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2014-03-01 16:06:54 GMT (Saturday 1st March 2014)"
	revision: "2"

class
	EL_REGISTRY_KEY_ITERATION_CURSOR

inherit
	ITERATION_CURSOR [WEL_REGISTRY_KEY]

create
	make

feature {NONE} -- Initialization

	make (reg_path: EL_DIR_PATH)
		do
			create registry
			registry_node := registry.open_key_with_access (reg_path.unicode, {WEL_REGISTRY_ACCESS_MODE}.Key_read)
			count := registry.number_of_subkeys (registry_node)
			cursor_index := 1
		end

feature -- Access

	item: WEL_REGISTRY_KEY
			-- Item at current cursor position.
		do
			Result := registry.enumerate_key (registry_node, cursor_index - 1)
		end

	cursor_index: INTEGER

feature -- Status report	

	after: BOOLEAN
			--
		do
			Result := cursor_index > count
		end

feature -- Cursor movement

	forth
			--
		do
			cursor_index := cursor_index + 1
		end

feature {NONE} -- Implementation

	count: INTEGER

	registry: WEL_REGISTRY

	registry_node: POINTER

end
