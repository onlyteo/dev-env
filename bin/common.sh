#!/bin/bash

INFO="INFO "
WARN="WARN "
ERROR="ERROR"

log() {
   level="$1"
   message="$2"
   suffix="$3"
   timestamp="$(date +"%H:%M:%S.%3N")"

   if [ -z "${message}" ]; then
      message = "${level}"
      level = "${INFO}"
   fi

   if [ -z "${suffix}" ]; then
      printf "%s %s %s" "${timestamp}" "${level}" "${message}"
   else
      printf "%s %s %s\n" "${timestamp}" "${level}" "${message}"
   fi
}

log_info() {
   log "${INFO}" "$1" "yes"
}

log_warn() {
   log "${WARN}" "$1" "yes"
}

log_error() {
   log "${ERROR}" "$1" "yes"
}

log_info_tail() {
   log "${INFO}" "$1"
}

log_warn_tail() {
   log "${WARN}" "$1"
}

log_error_tail() {
   log "${ERROR}" "$1"
}

log_tail() {
   message="$1"
   
   printf "%s\n" "${message}"
}
