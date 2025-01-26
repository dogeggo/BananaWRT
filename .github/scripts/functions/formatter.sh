#!/bin/bash

RESET="\e[0m"
BOLD="\e[1m"
DIM="\e[2m"
ITALIC="\e[3m"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
WHITE="\e[37m"

info() {
    echo -e "${BOLD}${BLUE}[INFO]${RESET} $1"
}

success() {
    echo -e "${BOLD}${GREEN}[SUCCESS]${RESET} $1"
}

warning() {
    echo -e "${BOLD}${YELLOW}[WARNING]${RESET} $1"
}

error() {
    echo -e "${BOLD}${RED}[ERROR]${RESET} $1"
}

debug() {
    echo -e "${DIM}${CYAN}[DEBUG]${RESET} $1"
}

section() {
    echo -e "${BOLD}${CYAN}--- $1 ---${RESET}"
}

formatted_text() {
    echo -e "${ITALIC}${DIM}${WHITE}$1${RESET}"
}
