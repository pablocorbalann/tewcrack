#!/bin/bash

# This file is part of tewcrack: github.com/pblcc/tewcrack
#
# It's the script that has to be used for installing the application
# in your computer or in termux.
#
# Run: sh install.sh
#
# !Please do not touch the script

# configuration variables
path="${HOME}/.tewcrack/"
new_path="${HOME}/.tewcrack-old/"
bin_dir="${HOME}/.local/bin/"
executable_name="tewcrack"

# include the functions
. core/funcs.sh

# check if some programs exist
if ! program_exists "git"; then
  error "Git is not installed, you have to install Git before using this app..."
fi

# once we have checked if the needed programs exist, start moving the programs
if [ -d "${path}" ]; then
  warn "You already have the ${path} folder, we are going to move this folder to ${new_path}"
  rm -rf "${new_path}"
  mv "${path}" "${npath}"
fi

rm -rf "${path}"
mkdir "${path}"
cp -r * "${path}"
cd "${path}"

ok "The path for the configuration of tewcrack is: ${path}..."

# move the executables to the bin folder so that the user can use them.
if ! [ -d "${bin_dir}" ]; then
  warn "Local bin directory not found, creating ${bin_dir}"
  mkdir -p "${bin_dir}"
fi

if [ -f "${bin_dir}${executable_name}" ]; then 
  warn "Executable already exists, skipping... Maybe you want to update Tewcrack, use update.sh"
else
  # Create the executable for tewcrack using chmod
fi
