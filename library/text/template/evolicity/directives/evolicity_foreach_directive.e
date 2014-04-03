note
	description: "[
		Syntax for looping over a sequence:
			
			#foreach <iteration object variable name> in <sequence name> loop
				
			#end
			
		The iteration object variable name references the current sequence item.
		Variable 'loop_index' references the sequence index
	]"

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2013-11-24 16:02:17 GMT (Sunday 24th November 2013)"
	revision: "4"

class
	EVOLICITY_FOREACH_DIRECTIVE

inherit
	EVOLICITY_COMPOUND_DIRECTIVE
		redefine
			execute, make
		end

create
	make

feature -- Initialization

	make
			--
		do
			Precursor
			create outer_loop_variables.make_with_count (3)
			create local_scope_variable_names.make_filled ("", 1, 2)
			local_scope_variable_names [2] := Loop_index_var_name
		end

feature -- Element change

	set_var_iterator (a_iterator_var_name: EL_ASTRING)
			--
		do
			iterator_var_name := a_iterator_var_name
			local_scope_variable_names [1] := a_iterator_var_name
		end

	set_traversable_container_variable_ref (a_traversable_container_variable_ref: EVOLICITY_VARIABLE_REFERENCE)
			--
		do
			traversable_container_variable_ref := a_traversable_container_variable_ref
		end

feature {NONE} -- Implementation

	execute (a_context: EVOLICITY_CONTEXT; output: IO_MEDIUM; utf8_encoded: BOOLEAN)
			--
		local
			loop_index: INTEGER_REF
			i: INTEGER
			name_space: like outer_loop_variables
			l_cursor: ITERATION_CURSOR [ANY]
		do
			name_space := a_context.objects
			if attached {ITERABLE [ANY]} a_context.referenced_item (traversable_container_variable_ref) as iterable then
				save_outer_loop_variables (name_space)
				create loop_index
				put_loop_index (a_context, loop_index)

				from l_cursor := iterable.new_cursor; i := 1 until l_cursor.after loop
					loop_index.set_item (i)
					if attached {ANY} l_cursor.item as cursor_item then
--						if attached {EVOLICITY_CONTEXT} cursor_item as container_context then
--							put_iteration_object (a_context, l_cursor, container_context)

--						elseif attached {STRING} cursor_item as string_item then
--							put_iteration_object (a_context, l_cursor, string_item)

--						elseif attached {ITERABLE [ANY]} cursor_item as nested_iterable then
--							put_iteration_object (a_context, l_cursor, nested_iterable)

--						else
--							put_iteration_object (a_context, l_cursor, cursor_item.out)
--						end
						if a_context.is_valid_type (cursor_item) then
							put_iteration_object (a_context, l_cursor, cursor_item)
						else
							put_iteration_object (a_context, l_cursor, cursor_item.out)
						end
					else
						name_space.remove (iterator_var_name)
					end
					Precursor (a_context, output, utf8_encoded)
					l_cursor.forth; i := i + 1
				end
				name_space.remove (iterator_var_name)

				restore_outer_loop_variables (name_space)
			end
		end

	put_loop_index (a_context: EVOLICITY_CONTEXT; a_loop_index: INTEGER_REF)
		do
			a_context.put_variable (a_loop_index, Loop_index_var_name)
		end

	put_iteration_object (a_context: EVOLICITY_CONTEXT; a_cursor: ITERATION_CURSOR [ANY]; a_iteration_object: ANY)
		do
			a_context.put_variable (a_iteration_object, iterator_var_name)
		end

	save_outer_loop_variables (name_space: like outer_loop_variables)
			-- Save value of context objects with same names as objects used in this loop
		require
			empty_saved_objects_context: outer_loop_variables.is_empty
		do
			across local_scope_variable_names as name loop
				name_space.search (iterator_var_name)
				if name_space.found then
					outer_loop_variables.extend (name_space.found_item, name.item)
				end
			end
		end

	restore_outer_loop_variables (name_space: like outer_loop_variables)
			-- Restore any previous objects that had the same name as objects used in this loop
		do
			across outer_loop_variables as variable loop
				name_space [variable.key] := variable.item
			end
			outer_loop_variables.wipe_out
		end

	iterator_var_name: EL_ASTRING

	traversable_container_variable_ref: EVOLICITY_VARIABLE_REFERENCE

	local_scope_variable_names: ARRAY [EL_ASTRING]

	outer_loop_variables: EVOLICITY_OBJECT_TABLE [ANY]
		-- Variables in outer loop that may have names clashing with this loop

feature -- Constants

	Loop_index_var_name: STRING
		once
			Result := "loop_index"
		end

end
