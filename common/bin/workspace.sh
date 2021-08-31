#!/bin/bash

CURRENT_DIR="${PWD}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROJECT=""
VERBOSE=false

source ${SCRIPT_DIR}/logging.sh
source ${SCRIPT_DIR}/dirs.sh

#
# Function for handling script exit
#
on_exit() {
   cd "${CURRENT_DIR}"
}

#
# Function for printing script usage information
#
print_usage() {
   echo "Usage: work [-h|--help] [-v|--verbose]"
}

#
# Function for parsing script arguments
#
parse_args() {
   while [ ! -z "$1" ]; do
      param="$1"
      case ${param} in
         -h | --help)
            print_usage
            exit 0
            ;;
         -v | --verbose)
            VERBOSE=true
            ;;
         *)
            PROJECT="$1"
            ;;
      esac
      shift
   done
}

trap 'on_exit' EXIT

# Parse scipt arguments
parse_args "$@"

# Run functionality
NEW_DIR="${WORKSPACE_DIR}/${PROJECT}"

if [ ! -d "${NEW_DIR}" ]; then
   log_error "Work directory ${NEW_DIR} does not exit"
   exit 1
fi

cd "${NEW_DIR}"

exit 0

