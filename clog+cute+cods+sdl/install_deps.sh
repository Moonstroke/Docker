#!/bin/bash

# This script installs all the required Git repositories from their remote URIs
# given in an external file whose name must be given as first parameter to this
# script

# Exit immediately if any command fails.
set -o errexit


# This function installs the repo whose remote is given as parameter.
# Functions declared in round parens are run in their own subshell.
function install_repo() (
	cd "$1"
	make
	make install
)

# This functions globally handles a Git remote URI.
function handle_uri() {
	local -l dir="${1##*/}"
	echo -n "Fetching \"$1\" into \"$dir\"..."
	git clone -q "$1" "$dir"
	echo " Done."
	echo -n "Installing..."
	install_repo "$dir"
	echo " Done."
	rm -rf "$dir"
	echo "Directory \"$dir\" removed."
}


while read -r line; do
	if [ ${#line} -ne 0 ] && [ "${line:0:1}" != '#' ]; then
		handle_uri $line
	fi
done < "$1"
echo "Done."
