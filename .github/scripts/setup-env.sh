#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/functions/formatter.sh"

ACTION=$1
VERBOSE=false
DRY_RUN=false

while [[ $# -gt 0 ]]; do
    case $1 in
        setup|clean)
            ACTION=$1
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -d|--dry-run)
            DRY_RUN=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [setup|clean] [options]"
            echo "Options:"
            echo "  -v, --verbose    Show detailed output"
            echo "  -d, --dry-run    Show what would be done without doing it"
            echo "  -h, --help       Show this help message"
            exit 0
            ;;
        *)
            error "Unknown option: $1"
            exit 1
            ;;
    esac
done

if [ -z "$ACTION" ]; then
    error "Usage: $0 [setup|clean] [options]"
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

info "Updating package list..."
if [ "$DRY_RUN" = false ]; then
    sudo apt -qq update
else
    info "[DRY RUN] Would update package list"
fi

ARCH=$(uname -m)
info "Detected architecture: $ARCH"

COMMON_PACKAGES="ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache clang cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext git gnutls-dev \
gperf haveged help2man intltool libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev \
libmpfr-dev libncurses-dev libpython3-dev libreadline-dev libssl-dev libtool libyaml-dev libz-dev \
lld llvm lrzsz mkisofs nano ninja-build p7zip p7zip-full patch pkgconf python3 python3-pip \
python3-ply python3-docutils python3-pyelftools qemu-utils re2c rsync scons squashfs-tools \
subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev zstd gh git jq"

X86_64_PACKAGES="gcc-multilib g++-multilib libc6-dev-i386 lib32gcc-s1"
AARCH64_PACKAGES="libc6-dev libdw-dev zlib1g-dev liblzma-dev libelf-dev libpfm4 libpfm4-dev libbabeltrace-dev libbabeltrace-ctf-dev libtool-bin"

is_package_installed() {
    local package=$1
    dpkg -l "$package" 2>/dev/null | grep -q "^ii"
}

get_packages_for_action() {
    local packages=$1
    local action=$2
    local result_packages=""
    
    for pkg in $packages; do
        if [ "$action" == "setup" ]; then
            if ! is_package_installed "$pkg"; then
                result_packages="$result_packages $pkg"
                [ "$VERBOSE" = true ] && info "Package $pkg needs to be installed"
            else
                [ "$VERBOSE" = true ] && info "Package $pkg is already installed"
            fi
        elif [ "$action" == "clean" ]; then
            if is_package_installed "$pkg"; then
                result_packages="$result_packages $pkg"
                [ "$VERBOSE" = true ] && info "Package $pkg will be removed"
            else
                [ "$VERBOSE" = true ] && info "Package $pkg is not installed"
            fi
        fi
    done
    
    echo "$result_packages"
}

manage_packages_batch() {
    local packages=$1
    local action=$2
    
    local packages_to_process=$(get_packages_for_action "$packages" "$action")
    
    if [ -z "$packages_to_process" ]; then
        info "No packages need to be processed for action: $action"
        return 0
    fi
    
    local package_count=$(echo $packages_to_process | wc -w)
    
    if [ "$action" == "setup" ]; then
        info "Installing $package_count packages: $(echo $packages_to_process | tr ' ' ',')"
        if [ "$DRY_RUN" = false ]; then
            if sudo apt -qq install -y $packages_to_process >/dev/null 2>&1; then
                success "$package_count packages installed successfully."
            else
                error "Failed to install some packages. Trying individually..."
                for pkg in $packages_to_process; do
                    if sudo apt -qq install -y "$pkg" >/dev/null 2>&1; then
                        success "Package $pkg installed successfully."
                    else
                        error "Failed to install package $pkg."
                    fi
                done
            fi
        else
            info "[DRY RUN] Would install: $packages_to_process"
        fi
    elif [ "$action" == "clean" ]; then
        info "Removing $package_count packages: $(echo $packages_to_process | tr ' ' ',')"
        if [ "$DRY_RUN" = false ]; then
            if sudo apt -qq remove --purge -y $packages_to_process >/dev/null 2>&1; then
                success "$package_count packages removed successfully."
            else
                error "Failed to remove some packages. Trying individually..."
                for pkg in $packages_to_process; do
                    if sudo apt -qq remove --purge -y "$pkg" >/dev/null 2>&1; then
                        success "Package $pkg removed successfully."
                    else
                        error "Failed to remove package $pkg."
                    fi
                done
            fi
        else
            info "[DRY RUN] Would remove: $packages_to_process"
        fi
    fi
}

show_package_stats() {
    local packages=$1
    local action=$2
    local packages_to_process=$(get_packages_for_action "$packages" "$action")
    local total_count=$(echo $packages | wc -w)
    local action_count=$(echo $packages_to_process | wc -w)
    local already_done=$((total_count - action_count))
    
    if [ "$action" == "setup" ]; then
        info "Package status: $already_done already installed, $action_count to install, $total_count total"
    else
        info "Package status: $already_done not installed, $action_count to remove, $total_count total"
    fi
}

if [ "$ACTION" == "setup" ]; then
    info "Upgrading installed packages..."
    if [ "$DRY_RUN" = false ]; then
        sudo apt -qq full-upgrade -y >/dev/null 2>&1 && \
        success "System upgraded successfully." || \
        error "System upgrade failed."
    else
        info "[DRY RUN] Would upgrade system packages"
    fi

    section "Setting up common packages"
    show_package_stats "$COMMON_PACKAGES" "setup"
    manage_packages_batch "$COMMON_PACKAGES" "setup"

    if [ "$ARCH" == "x86_64" ]; then
        section "Setting up packages for x86_64"
        show_package_stats "$X86_64_PACKAGES" "setup"
        manage_packages_batch "$X86_64_PACKAGES" "setup"
    elif [ "$ARCH" == "aarch64" ]; then
        section "Setting up packages for aarch64"
        show_package_stats "$AARCH64_PACKAGES" "setup"
        manage_packages_batch "$AARCH64_PACKAGES" "setup"
    else
        error "Unknown architecture: $ARCH"
        exit 1
    fi
elif [ "$ACTION" == "clean" ]; then
    section "Cleaning up common packages"
    show_package_stats "$COMMON_PACKAGES" "clean"
    manage_packages_batch "$COMMON_PACKAGES" "clean"

    if [ "$ARCH" == "x86_64" ]; then
        section "Cleaning up packages for x86_64"
        show_package_stats "$X86_64_PACKAGES" "clean"
        manage_packages_batch "$X86_64_PACKAGES" "clean"
    elif [ "$ARCH" == "aarch64" ]; then
        section "Cleaning up packages for aarch64"
        show_package_stats "$AARCH64_PACKAGES" "clean"
        manage_packages_batch "$AARCH64_PACKAGES" "clean"
    else
        error "Unknown architecture: $ARCH"
        exit 1
    fi
else
    error "Invalid action: $ACTION"
    error "Usage: $0 [setup|clean] [options]"
    exit 1
fi

info "Final cleaning..."
if [ "$DRY_RUN" = false ]; then
    sudo apt -qq autoremove --purge -y >/dev/null 2>&1 && \
    success "Unused packages removed successfully." || \
    error "Failed to remove unused packages."
    sudo apt -qq clean >/dev/null 2>&1 && \
    success "Package cache cleaned successfully." || \
    error "Failed to clean package cache."
else
    info "[DRY RUN] Would remove unused packages and clean cache"
fi

success "Operation completed successfully!"