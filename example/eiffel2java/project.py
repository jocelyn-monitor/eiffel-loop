# EiffelStudio project environment

from eiffel_loop.project import *
	
major_version = 1

minor_version = 0

installation_sub_directory = 'Eiffel-Loop/eiffel2java'

tests = TESTS ('$EIFFEL_LOOP/projects.data')
tests.append (['-java_velocity_test', '-logging'])
tests.append (['-java_test', '-logging'])

