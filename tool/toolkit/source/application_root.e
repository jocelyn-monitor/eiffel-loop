﻿note
	description: ""

	author: "Finnian Reilly"
	copyright: "Copyright (c) 2001-2014 Finnian Reilly"
	contact: "finnian at eiffel hyphen loop dot com"
	
	license: "MIT license (See: en.wikipedia.org/wiki/MIT_License)"
	date: "2015-07-27 12:03:07 GMT (Monday 27th July 2015)"
	revision: "9"

class
	APPLICATION_ROOT

inherit
	EL_MULTI_APPLICATION_ROOT [BUILD_INFO]

create
	make

feature {NONE} -- Implementation

	Application_types: ARRAY [TYPE [EL_SUB_APPLICATION]]
			--
		once
			Result := <<
				{CODEC_GENERATOR_APP},
				{CRYPTO_APP},

				{EIFFEL_CLASS_EDITOR_APP},
				{EIFFEL_CLASS_LIBRARY_MANIFEST_APP},
				{EIFFEL_CLASS_PREFIX_REMOVAL_APP},

				{EIFFEL_CODE_HIGHLIGHTING_TEST_APP},
				{EIFFEL_CODEBASE_STATISTICS_APP},

				{EIFFEL_ECF_TO_PECF_APP},

				{EIFFEL_FEATURE_EDITOR_APP},
				{EIFFEL_FIND_AND_REPLACE_APP},

				{EIFFEL_LIBRARY_OVERRIDE_APP},
				{EIFFEL_NOTE_EDITOR_APP},

				{EIFFEL_UPGRADE_DEFAULT_POINTER_SYNTAX_APP},
				{EIFFEL_UPGRADE_LOG_FILTERS_APP},

				{EIFFEL_SOURCE_FILE_NAME_NORMALIZER_APP},
				{EIFFEL_SOURCE_LOG_LINE_REMOVER_APP},
				{EIFFEL_SOURCE_TREE_CLASS_RENAME_APP},

				{EXPORT_THUNDERBIRD_HTML_APP},
				{FTP_BACKUP_APP},

				{JOBSERVE_SEARCH_APP},
				{LOGIN_MONITOR_APP},
				{PRAAT_GCC_SOURCE_TO_MSVC_CONVERTOR_APP},

				{PYXIS_COMPILER_APP},
				{PYXIS_ENCRYPTER_APP},
				{PYXIS_TO_XML_APP},

				{VCF_CONTACT_SPLITTER_APP},
				{VCF_CONTACT_NAME_SWITCHER_APP},

				{WEB_PUBLISHER_APP},
				{XML_TO_PYXIS_APP}
			>>
		end

	notes: TUPLE [PROJECT_NOTES, DONE_LIST, TO_DO_LIST]
		do
		end

end
