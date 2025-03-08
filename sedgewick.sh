## Copyright © Damien Pichard 2025
## Author: Damien Pichard <damienpichard@tuta.com>

## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Code:

source /dev/stdin <<< "$(curl -sLJ https://gist.githubusercontent.com/damienpichard/714cbe584353ba98b4cf52cef999e794/raw/assert.sh)"
source /dev/stdin <<< "$(curl -sLJ https://gist.githubusercontent.com/damienpichard/fc1f226f23c7a5a8afecbdaa4b94c5c5/raw/colors.sh)"
source /dev/stdin <<< "$(curl -sLJ https://gist.githubusercontent.com/damienpichard/5b7222651145769c8dc1f45111c7af8f/raw/helpers.sh)"

function print_usage() {
    printf "Usage: ${TEXT_FORMAT_NOESC_BOLD}${0}${TEXT_FORMAT_NOESC_RESET} <${TEXT_FORMAT_NOESC_UNDERLINE}book${TEXT_FORMAT_NOESC_RESET}> [${TEXT_FORMAT_NOESC_UNDERLINE}exercise${TEXT_FORMAT_NOESC_RESET}]\n"
    printf "    commands:\n"
    printf "        ${TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA}java${TEXT_FORMAT_NOESC_RESET}    ${TEXT_FORMAT_NOESC_FOREGROUND_CYAN}[exercise]${TEXT_FORMAT_NOESC_RESET}        build and run ${TEXT_FORMAT_NOESC_BOLD}exercise${TEXT_FORMAT_NOESC_RESET} in a specific chapter\n"
    printf "        ${TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA}algs${TEXT_FORMAT_NOESC_RESET}    ${TEXT_FORMAT_NOESC_FOREGROUND_CYAN}[exercise]${TEXT_FORMAT_NOESC_RESET}        build and run ${TEXT_FORMAT_NOESC_BOLD}exercise${TEXT_FORMAT_NOESC_RESET} in a specific chapter\n"
    printf "        ${TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA}aofa${TEXT_FORMAT_NOESC_RESET}    ${TEXT_FORMAT_NOESC_FOREGROUND_CYAN}[exercise]${TEXT_FORMAT_NOESC_RESET}        build and run ${TEXT_FORMAT_NOESC_BOLD}exercise${TEXT_FORMAT_NOESC_RESET} in a specific chapter\n"
    printf "        ${TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA}ac${TEXT_FORMAT_NOESC_RESET}      ${TEXT_FORMAT_NOESC_FOREGROUND_CYAN}[exercise]${TEXT_FORMAT_NOESC_RESET}        build and run ${TEXT_FORMAT_NOESC_BOLD}exercise${TEXT_FORMAT_NOESC_RESET} in a specific chapter\n"
    printf "    info:\n"
    printf "        ${TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA}java${TEXT_FORMAT_NOESC_RESET}    stands for '${TEXT_FORMAT_NOESC_BOLD}${TEXT_FORMAT_NOESC_FOREGROUND_BLUE}Computer Sciences: an interdisciplinary approach${TEXT_FORMAT_NOESC_RESET}'\n"
    printf "        ${TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA}algs${TEXT_FORMAT_NOESC_RESET}    stands for '${TEXT_FORMAT_NOESC_BOLD}${TEXT_FORMAT_NOESC_FOREGROUND_RED}Algorithms${TEXT_FORMAT_NOESC_RESET}'\n"
    printf "        ${TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA}aofa${TEXT_FORMAT_NOESC_RESET}    stands for '${TEXT_FORMAT_NOESC_BOLD}${TEXT_FORMAT_NOESC_FOREGROUND_CYAN}An Introduction to the Analysis of Algorithms${TEXT_FORMAT_NOESC_RESET}'\n"
    printf "        ${TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA}ac${TEXT_FORMAT_NOESC_RESET}      stands for '${TEXT_FORMAT_NOESC_BOLD}${TEXT_FORMAT_NOESC_FOREGROUND_MAGENTA}Analytic Combinatorics${TEXT_FORMAT_NOESC_RESET}'\n"
}

function build_and_run {
    case ${1} in
        java) BOOK_DIRECTORY=java ;;
        algs) BOOK_DIRECTORY=algs ;;
        aofa) BOOK_DIRECTORY=aofa ;;
        ac)   BOOK_DIRECTORY=ac   ;;
    esac

    EXERCISE_DIRECTORY="${BOOK_DIRECTORY}/${2}"

    if assert_file_exists "${EXERCISE_DIRECTORY}/makefile"; then
        make -k -C "${EXERCISE_DIRECTORY}"
    else
        print_error "no such file or directory: '${EXERCISE_DIRECTORY}'"
        exit 1
    fi
}

function main {
    if assert_eq ${#@} 2; then
        build_and_run ${@}
    else
        print_usage
    fi
}

main ${@}
