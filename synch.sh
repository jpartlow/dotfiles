#! /usr/bin/env bash

###############################################################################
# Configure a user's environment by linking configuration files in this
# repository's src/ directory. See usage() for details.

script=$(readlink -f "$0")
repodir=$(readlink -f $(dirname "$0"))
srcdir="${repodir?}/src"
timestamp=$(date +'%Y%m%d%H%M%s')

usage() {
    [ -n "$1" ] && echo "** $1"

    echo "
USAGE: ${script} -d /home/directory [-h]

OPTIONS:

    -d The directory the script will link configuration into.

    -h This help message.

So typical usage:

cd \$HOME
git clone git@github.com:jpartlow/dotfiles
dotfiles/sync.sh \$HOME

The script will make a timestamp backup of any file or directory that is
pre-existing before symlinking.
    "
}

validate() {
    if [ -z "${homedir}" ]; then
        usage "You must specify -d"
        exit 1
    fi
}

linked() {
    local t_src_file="${1?}"
    local t_target_file="${2?}"

    if [ -L "${t_target_file}" ]; then
        local t_current_target
        t_current_target=$(readlink -f "${t_target_file}")
    fi

    if [ ! -L "${t_target_file}" ] || [ "${t_src_file}" != "${t_current_target}" ]; then
        return 1
    fi
}

backup() {
    local t_file_to_backup="${1?}"

    if [ -e "${t_file_to_backup}" ]; then
	set -x
        mv "${t_file_to_backup}" "${t_file_to_backup}.${timestamp?}.bak"
	set +x
    fi
}

while getopts d:h opt; do
    case "$opt" in
        d)
            homedir="${OPTARG}"
            ;;
        h)
            ;;
        ?)
            usage "Invalid argument '$opt'"
            ;;
    esac
done

validate

# include .hidden files in the glob
shopt -s dotglob
for path in ${srcdir?}/*; do
    file=$(basename "$path")
    target="${homedir?}/${file?}"
    echo "$file -> $target"
    if ! linked "${path?}" "${target?}"; then
        backup "${target?}"
        ln -s "${path?}" "${target?}"
    fi
done
shopt -u dotglob
