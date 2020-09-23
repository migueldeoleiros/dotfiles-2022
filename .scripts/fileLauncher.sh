#!/bin/sh

# Simple menu to open files based on dmenufm from github user huijunchen9260
# Dependencies:dmenu (it works with rofi if you do a symlink to dmenu)

### OPTIONS AND VARIABLES

XDGDIR1="/usr/share/applications"
XDGDIR2="/usr/local/share/applications"
# FONT
GENEFONT="Monospace-20"
NOTIFONT="Monospace-30"
DANGERFONT="Monospace-30"


## GLOBAL VARIABLES
CHOICE="placeholder"
actCHOICE="placeholder"
TARGET="./"
BACKWARD="../"


### FUNCTIONS

## OPEN FUNCTIONS
executecmd () {
	software=$(printf '%s' "$1" | awk -F ' ' '{print $1}')
	if < "$(find "$XDGDIR1" "$XDGDIR2" *"$software"*.desktop | tail -n 1)" grep "Terminal=false"; then
		printf '%s' "$1" | ${SHELL:-"/bin/sh"}
	else
		$TERMINAL -e $1 | ${SHELL:-"/bin/sh"}
	fi
}

# Open files with xdg-open
# To edit default applications in xdg-open,
# sudo $EDITOR /usr/share/applications/mimeinfo.cache
open () {
	appdesktop=$(xdg-mime query filetype "$1" | xargs -I {} xdg-mime query default "{}")
	if < "$(find "$XDGDIR1" "$XDGDIR2" -name "$appdesktop" | tail -n 1)" grep "Terminal=false"; then
		xdg-open "$1"
	else
		$TERMINAL -e xdg-open "$1"
	fi
}


## MENUFUNCTIONS

# Generate directories
# Variables cannot store multiline string, so transform to ':'
# Misbehaving due to space in file/directory name, so add ' at beginning and end.
menudir () {
	DIRs=$(for dir in *; do [ -d "$dir" ] && printf '%s:' "$dir/"; done | sed "1 s/^/'/; s/$/'/")
}

# Generate dotdirectories
# Delete extra ./ and ../ (Need use = as sed delimiter)
menudotdir () {
	DOTDIRs=$(for dir in .*; do [ -d "$dir" ] && printf '%s:' "$dir/"; done | sed "1 s/^/'/; s/$/'/; s=./==; s=../==")
}

# Generate files
menufile () {
	FILEs=$(for file in *; do [ -f "$file" ] && printf '%s:' "$file"; done | sed "1 s/^/'/; s/$/'/")
}

# Generate dotfiles
menudotfile () {
	DOTFILEs=$(for file in .*; do [ -f "$file" ] && printf '%s:' "$file"; done | sed "1 s/^/'/; s/$/'/")
}

# Generate default menu
menu () {
	menudir
	menudotdir
	menufile
	menudotfile
}

# Update menu in each move
update_menu () {
	list=
	# Rebuild list in every move
	for element in $keeplist; do
		case $element in
			DIRs) menudir && list="$list$DIRs" ;;
			FILEs) menufile && list="$list$FILEs" ;;
			DOTDIRs) menudotdir && list="$list$DOTDIRs" ;;
			DOTFILEs) menudotfile && list="$list$DOTFILEs" ;;
		esac
	done
}

## PROMPT FUNCTIONS

verticalprompt () {
	# $1 is prompt
	dmenu -fn "$GENEFONT" -i -sb "$2" -l 10 -p "$1"
}

horizontalprompt () {
	# $1 is prompt
	dmenu -fn "$GENEFONT" -i -sb "$2" -p "$1"
}


## Exit actions when press ESC in menu
escape () {
	[ -n "$1" ] || return
}


### MAIN FUNCTIONS

file_launcher_menu () {
	while [ -n "$CHOICE" ]; do
		update_menu
		# Default menu list if no arguments given
		[ -z "$keeplist" ] && menu && list="$DIRs$FILEs$DOTDIRs$DOTFILEs"
		# Generate menu with/without arguments
		# Show only the current directory and one level of parent directory
		twopwd=$(printf '%s' "$PWD" | awk -F '/' '{print $(NF-1)"/"$NF}')
		CHOICE=$(printf '%s:' "$BACKWARD" "$TARGET" "$list" | tr ':' '\n' | sed "s/'//g; /^$/ d" | verticalprompt "$twopwd" "#005577")
		# Outcome matching
		if [ "$CHOICE" = "$TARGET" ]; then
			open "$PWD"
		elif [ "$CHOICE" = "$BACKWARD" ]; then
			cd "../"
			dmenufm_history
		elif [ -d "$CHOICE" ]; then
			cd "$CHOICE" || exit 1
			dmenufm_history
			continue
		elif [ -f "$CHOICE" ]; then
			open "$PWD/$CHOICE"
		else
			break
		fi
	done
}

### ARGUMENTS

while [ -n "$1" ]; do
	case $1 in
		"-d"|"--directory" )
			keeplist="${keeplist} DIRs"
			;;
		"-f"|"--file" )
			keeplist="${keeplist} FILEs"
			;;
		"-D"|"--dotdirectory" )
			keeplist="${keeplist} DOTDIRs"
			;;
		"-F"|"--dotfile" )
			keeplist="${keeplist} DOTFILEs"
			;;
		"-h"|"--help" )
			printf "Optional arguments for custom use:
			-d | --directory: menu is directories, no input
			-f | --file: menu is files, no input
			-D | --dotdirectory: menu is hidden directories, no input
			-F | --dotfile: menu is hidden files, no input
			-h | --help: Show this message\\n"
			exit 0
			;;
		"*" )
			printf "Invalid option"
			exit 1
			;;
	esac
	shift
done

### RUN THE MAIN FUNCTION
file_launcher_menu
