#!/bin/bash

CURRENT_DIR="${PWD}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROJECT=""
VERBOSE=false

source ${SCRIPT_DIR}/../../common/bin/logging.sh
source ${SCRIPT_DIR}/../../common/bin/dirs.sh
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
print_usage() {
   echo "Usage: clone [-h|--help] [-v|--verbose] [-p|--project <project>] [--all]"
   echo -e "\nArguments:"
   echo -e "\t-h or --help\t\t\t\t\t\tPrint this help."
   echo -e "\t-v or --verbose\t\t\t\t\t\tPrint verbose information."
   echo -e "\t-p <project> or --project <project>\t\tWill set which project repositories to clone."
   echo -e "\t--all\t\t\t\t\t\t\tWill clone all repositories for all projects."
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
         --all)
            if [ -n "${PROJECT}" ]; then
               log_error "Application already specified"
               print_usage
               exit 1
            fi
            PROJECT="_ALL_PROJECTS"
            ;;
         -p | --project)
            if [ -n "${PROJECT}" ]; then
               log_error "Application already specified"
               print_usage
               exit 1
            fi
            shift
            PROJECT="$1"
            if [ -z "${PROJECT}" ]; then
               log_error "Application not specified when using -p/--project argument"
               print_usage
               exit 1
            fi
            ;;
         *)
            log_error "Unknown parameter \"${param}\""
            print_usage
            exit 1
            ;;
      esac
      shift
   done
}

#
# Function for cloning all repos for a project
#
clone_repo() {
   repo="$1"
   verbose="$2"

   if [ -z "${repo}" ]; then
      log_error "Repository is blank"
      exit 1
   fi

   GIT_URL="${GIT_SERVER_URL}/${repo}.git"
   REPO_DIR="${WORKSPACE_DIR}/${repo}"

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
   case "${PROJECT}" in

      "_ALL_PROJECTS")
      log_info "Cloning all repositories for all projects"
      repos=( ${GIT_REPOS[@]} )
      ;;
      *)
      log_info "Cloning repositories for project \"${PROJECT}\""
      for repo in "${GIT_REPOS[@]}"
      do
         if [[ "${repo}" =~ ^"${PROJECT}"\/.+$ ]]; then
            repos+=("${repo}")
         fi
      done
      ;;
   esac

   # Check if repo list is empty
   if [ ${#repos[@]} -eq 0 ]; then
      log_error "Repository list is empty"
      exit 1
   fi

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

if [ -z "${PROJECT}" ]; then
   print_usage
   exit 1
fi

if [ -z "${GIT_REPOS}" ]; then
   log_error "Repository list is not defined"
   exit 1
fi

# Run functionality
clone_repos

exit 0
