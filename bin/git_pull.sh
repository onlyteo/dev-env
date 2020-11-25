#!/bin/bash

CURRENT_DIR="${PWD}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

APPLICATION=""
UNDO=false
BRANCH=""
VERBOSE=false

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
   echo "Usage: pull [all] [-h|--help] [-v|--verbose] [-u|--undo] [-d|--develop]"
   echo -e "\nArguments:"
   echo -e "\t-h or --help\t\tPrint this help."
   echo -e "\t-v or --verbose\t\tPrint verbose information."
   echo -e "\t-u or --undo\t\tReset any changes made in all repositories. WARNING: Your changes will be lost!"
   echo -e "\t-d or --develop\t\tWill checkout the develop branch in all repositories."
   echo -e "\t-m or --master\t\tWill checkout the master branch in all repositories."
   echo -e "\t-b <branch> or --branch <branch>\t\tWill checkout the <branch> branch in all repositories."
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
         -u | --undo)
            UNDO=true
            ;;
         -d | --develop)
            BRANCH="develop"
            ;;
         -m | --master)
            BRANCH="master"
            ;;
         -b | --branch)
            shift
            BRANCH="$1"
            if [ -z "${BRANCH}" ]; then
               log_error "Branch not specified when using -b/--branch argument"
               usage
               exit 1
            fi
            ;;
         all)
            APPLICATION="${param}"
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
# Function for pulling one of the repos for an application
#
pull_repo() {
   repo="$1"
   verbose="$2"

   if [ -z "${repo}" ]; then
      log_error "Repository directory is blank"
      exit 1
   fi

   REPO_DIR="${REPO_ROOT_DIR}/${repo}"

   if [ ! -d "${REPO_DIR}" ]; then
      log_warn "Repository directory ${REPO_DIR} does not exist"
      return
   fi

   cd "${REPO_DIR}"

   if [ ! git status > /dev/null 2>&1 ]; then
      log_warn "Directory ${REPO_DIR} is not a Git repository"
      return
   fi

   current_branch=$(git rev-parse --abbrev-ref HEAD)

   if [ "${UNDO}" = true ]; then
      log_info "Resetting changes for repository <${repo}> on branch <${current_branch}>"
      
      if [ "${VERBOSE}" = true ]; then
         git checkout -- .
      else
         git checkout -- . > /dev/null 2>&1
      fi
   fi

   if [ ! -z "${BRANCH}" ]; then

      log_info_tail "Checking out <${BRANCH}> for repository <${repo}>"

      if [ "${VERBOSE}" = true ]; then
         if git checkout "${BRANCH}"; then
            log_tail ": success!"
         else
            log_tail ": failed!"
         fi
      else
         if git checkout "${BRANCH}" > /dev/null 2>&1; then
            log_tail ": success!"
         else
            log_tail ": failed!"
         fi
      fi
   fi

   current_branch=$(git rev-parse --abbrev-ref HEAD)

   changes=""
   if [ ! -z "$(git status --untracked-files=no --porcelain)" ]; then
      changes=" (has uncommited changes)"
   fi

   log_info_tail "Pulling repository <${repo}> on branch <${current_branch}>${changes}"

   if [ "${VERBOSE}" = true ]; then
      if git pull; then
         log_tail ": success!"
      else
         log_tail ": failed!"
      fi
   else
      if git pull > /dev/null 2>&1; then
         log_tail ": success!"
      else
         log_tail ": failed!"
      fi
   fi
}

#
# Function for pulling all repos for an application
#
pull_repos() {
   repos=()

   # Select list of repos based on user input
   case "${APPLICATION}" in

      "all")
      log_info "Pulling all repositories"
      repos=( ${REPOS[@]} )
      ;;

      *)
      usage
      exit 1
      ;;
   esac

   # Loop through list of repos and pull each
   for repo in "${repos[@]}"
   do
      pull_repo "${repo}"
   done

   log_info "Done!"
}

trap 'on_exit' EXIT

if [ ! -f ${SCRIPT_DIR}/repos.sh ]; then
   log_error "No repos script found"
   exit 1
fi

if [ -z "${REPOS}" ]; then
   log_error "No repos defined in script file"
   exit 1
fi

# Parse scipt arguments
parse_args "$@"

if [ -z "${APPLICATION}" ]; then
   usage
   exit 1
fi

# Run functionality
pull_repos

exit 0
