# Normalizes a pot file generated by xgettext, so we can compare new files
# to see if they've changed. Normalization removes creation date, and sets
# the charset to UTF-8.
#
# Usage:
#   cmake -DPOT_FILE=<pot_file_name> \
#         -DSOURCE_DIR=<CMAKE_CURRENT_SOURCE_DIR> \
#         -P normalize_pot.cmake

file(READ ${POT_FILE} FILE_CONTENT)
string(REPLACE "charset=CHARSET" "charset=UTF-8"
    FILE_CONTENT "${FILE_CONTENT}")
string(REGEX REPLACE "POT-Creation-Date: [^\\]*" "POT-Creation-Date: "
    FILE_CONTENT "${FILE_CONTENT}")
string(REPLACE "${SOURCE_DIR}/" "" FILE_CONTENT "${FILE_CONTENT}")
file(WRITE ${POT_FILE} "${FILE_CONTENT}")
