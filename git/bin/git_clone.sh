#!/bin/bash

CURRENT_DIR="${PWD}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source ${SCRIPT_DIR}/common.sh
source ${SCRIPT_DIR}/repos.sh

#
# Function for handling script exit
#
on_exit() {
   cd "${CURRENT_DIR}"
}

#
# Function for printing script usage information
#
usage() {
   echo "Usage: clone [all] [-h|--help] [-v|--verbose]"
   echo -e "\nArguments:"
   echo -e "\t-h or --help\t\t\t\t\t\tPrint this help."
   echo -e "\t-v or --verbose\t\t\t\t\t\tPrint verbose information."
   echo -e "\t-a <application> or --application <application>\t\tWill set which application repositories to clone."
   echo -e "\t--all\t\t\t\t\t\t\tWill clone all repositories for all applications."
}

#
# Function for parsing script arguments
#
parse_args() {
   while [ ! -z "$1" ]; do
      param="$1"
      case ${param} in
         -h | --help)
            usage
            exit 0
            ;;
         -v | --verbose)
            VERBOSE=true
            ;;
         --all)
            if [ -n "${APPLICATION}" ]; then
               log_error "Application already specified"
               usage
               exit 1
            fi
            APPLICATION="PULL_ALL_APPLICATIONS"
            ;;
         -a | --application)
            if [ -n "${APPLICATION}" ]; then
               log_error "Application already specified"
               usage
               exit 1
            fi
            shift
            APPLICATION="$1"
            if [ -z "${APPLICATION}" ]; then
               log_error "Application not specified when using -a/--application argument"
               usage
               exit 1
            fi
            ;;
         *)
            log_error "Unknown parameter \"${param}\""
            usage
            exit 1
            ;;
      esac
      shift
   done
}

#
# Function for cloning all repos
#
clone_repo() {
   repo="$1"
   verbose="$2"

   if [ -z "${repo}" ]; then
      log_error "Repository is blank"
      exit 1
   fi

   GIT_URL="${GIT_SERVER_URL}/${repo}.git"
   REPO_DIR="${REPO_ROOT_DIR}/${repo}"

   if [ -d "${REPO_DIR}" ]; then
      log_warn "Repository directory ${REPO_DIR} already exists"
      return
   fi

   if [ ! -d "${REPO_DIR}" ]; then
      log_info "Project directory ${REPO_DIR} does not exist, creating it"
      mkdir -p "${REPO_DIR}"
   fi

   log_info "Cloning repository ${GIT_URL} into ${REPO_DIR}"
   if [ "${VERBOSE}" = true ]; then
      git clone "${GIT_URL}" "${REPO_DIR}"
   else
      git clone "${GIT_URL}" "${REPO_DIR}" > /dev/null 2>&1
   fi
}

#
# Function for cloning all repos
#
clone_repos() {
   repos=()

   # Select list of repos based on user input
   case "${APPLICATION}" in

      "PULL_ALL_APPLICATIONS")
      log_info "Cloning all repositories for all applications"
      repos=( ${REPOS[@]} )
      ;;
      *)
      log_info "Cloning repositories for application \"${APPLICATION}\""
      for repo in "${REPOS[@]}"
      do
         if [[ "${repo}" =~ ^"${APPLICATION}"\/.+$ ]]; then
            repos+=("${repo}")
         fi
      done
      ;;
   esac

   # Loop through list of repos and clone each
   for repo in "${repos[@]}"
   do
      clone_repo "${repo}"
   done

   log_info "Done!"
}

trap 'on_exit' EXIT

# Parse scipt arguments
parse_args "$@"

if [ -z "${APPLICATION}" ]; then
   usage
   exit 1
fi

# Run functionality
clone_repos

exit 0
