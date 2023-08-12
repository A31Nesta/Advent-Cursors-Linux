#! /bin/sh

## Noiire Cursor Installer for Linux
## by A31Nesta
##
## This script should for any cursor theme
## made by Noiire (@noiireism on twitter)


# Check for the virtual env
VENV="${HOME}/cursorVenv"

if [ ! -d ${VENV} ]
then
	echo "Venv does not exist, creating virtual environment..."
	python -m venv ${VENV}
	echo "Done! Installing win2xcur..."
	${VENV}/bin/pip install win2xcur
	echo "Done!"
fi

dir="."

# Read Install.inf to get cursor names
# apparently all of noiire's cursors include that
# file, making it possible to create a universal
# install script
input="$dir/Install.inf"
inString=false
while IFS= read -r line
do
	# This is cursed but idk why it doesn't work normally
	if [ "${line:0:9}" = "[Strings]" ]; then
		inString=true
	elif [ "$inString" = true ]; then

		if [ "${line:0:7}" = "pointer" ]; then
			pointer=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Pointer: $pointer"

		elif [ "${line:0:4}" = "help" ]; then
			help=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Help: $help"

		elif [ "${line:0:4}" = "work" ]; then
			work=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Work: $work"

		elif [ "${line:0:4}" = "busy" ]; then
			busy=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Busy: $busy"

		elif [ "${line:0:4}" = "text" ]; then
			text=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Text: $text"

		# There's a typo, so in case the typo is fixed at some point I've added
		# both 'unavailiable' and 'unavailable' as options
		elif [ "${line:0:12}" = "unavailiable" ]; then
			unavailable=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Unavailable: $unavailable"
		elif [ -z "$unavailable" ] && [ "${line:0:11}" = "unavailable" ]; then
			unavailable=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Unavailable: $unavailable"

		elif [ "${line:0:4}" = "vert" ]; then
			vert=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Vert: $vert"

		elif [ "${line:0:4}" = "horz" ]; then
			horz=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Horz: $horz"

		elif [ "${line:0:4}" = "dgn1" ]; then
			dgn1=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Dgn1: $dgn1"

		elif [ "${line:0:4}" = "dgn2" ]; then
			dgn2=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Dgn2: $dgn2"

		elif [ "${line:0:4}" = "move" ]; then
			move=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Move: $move"

		elif [ "${line:0:4}" = "link" ]; then
			link=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Link: $link"

		elif [ "${line:0:5}" = "cross" ]; then
			cross=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Cross: $cross"

		elif [ "${line:0:4}" = "hand" ]; then
			hand=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "File name for Hand: $hand"

		# Name of the Theme
		elif [ "${line:0:11}" = "SCHEME_NAME" ]; then
			name=$(echo "$line" | cut -d \" -f 2 | cut -d . -f 1)
			echo "Name of the Theme: $name"
		fi
	fi
done < "$input"

# Create folders with theme name
output="$HOME/.icons/$name/cursors"
outputRoot="$HOME/.icons/$name"

if [ ! -d "${output}" ]
then
	mkdir -p "$output"
fi

${VENV}/bin/win2xcur "$dir"/*.ani -o "$output"
${VENV}/bin/win2xcur "$dir"/*.cur -o "$output"

echo "Directory was converted successfully"


# create symlinks
# default
file="$pointer"
ln -s "$output/$file" "$output/default"
ln -s "$output/$file" "$output/arrow"
ln -s "$output/$file" "$output/left_ptr"
ln -s "$output/$file" "$output/size-ver"
ln -s "$output/$file" "$output/size-hor"
ln -s "$output/$file" "$output/size-bdiag"
ln -s "$output/$file" "$output/size-fdiag"
ln -s "$output/$file" "$output/top_left_arrow"
echo "Created symlinks for $output/$file"

# text
file="$text"
ln -s "$output/$file" "$output/text"
ln -s "$output/$file" "$output/xterm"
ln -s "$output/$file" "$output/ibeam"
echo "Created symlinks for $output/$file"

# size_hor
file="$horz"
ln -s "$output/$file" "$output/size_hor"
ln -s "$output/$file" "$output/w-resize"
ln -s "$output/$file" "$output/ew-resize"
ln -s "$output/$file" "$output/e-resize"
ln -s "$output/$file" "$output/h_double_arrow"
ln -s "$output/$file" "$output/sb_h_double_arrow"
echo "Created symlinks for $output/$file"

# size_ver
file="$vert"
ln -s "$output/$file" "$output/size_ver"
ln -s "$output/$file" "$output/n-resize"
ln -s "$output/$file" "$output/ns-resize"
ln -s "$output/$file" "$output/s-resize"
ln -s "$output/$file" "$output/v_double_arrow"
ln -s "$output/$file" "$output/sb_v_double_arrow"
echo "Created symlinks for $output/$file"

# move
file="$move"
ln -s "$output/$file" "$output/all-scroll"
ln -s "$output/$file" "$output/fleur"
ln -s "$output/$file" "$output/size_all"
echo "Created symlinks for $output/$file"

# size_bdiag
file="$dgn2"
ln -s "$output/$file" "$output/size_bdiag"
ln -s "$output/$file" "$output/ne-resize"
ln -s "$output/$file" "$output/nesw-resize"
ln -s "$output/$file" "$output/sw-resize"
echo "Created symlinks for $output/$file"

# size_fdiag
file="$dgn1"
ln -s "$output/$file" "$output/size_fdiag"
ln -s "$output/$file" "$output/nw-resize"
ln -s "$output/$file" "$output/nwse-resize"
ln -s "$output/$file" "$output/se-resize"
echo "Created symlinks for $output/$file"

# progress
file="$work"
ln -s "$output/$file" "$output/progress"
ln -s "$output/$file" "$output/half-busy"
ln -s "$output/$file" "$output/left_ptr_watch"
echo "Created symlinks for $output/$file"

# wait
file="$busy"
ln -s "$output/$file" "$output/wait"
ln -s "$output/$file" "$output/watch"
echo "Created symlinks for $output/$file"
	
# not_allowed
file="$unavailable"
ln -s "$output/$file" "$output/not-allowed"
ln -s "$output/$file" "$output/crossed_circle"
ln -s "$output/$file" "$output/circle"
# no_drop
ln -s "$output/$file" "$output/no-drop"
ln -s "$output/$file" "$output/forbidden"
echo "Created symlinks for $output/$file"

# precision
file="$cross"
ln -s "$output/$file" "$output/crosshair"
ln -s "$output/$file" "$output/tcross"
ln -s "$output/$file" "$output/cross"
echo "Created symlinks for $output/$file"
	
# help
file="$help"
ln -s "$output/$file" "$output/help"
ln -s "$output/$file" "$output/left_ptr_help"
ln -s "$output/$file" "$output/question_arrow"
ln -s "$output/$file" "$output/whats_this"
echo "Created symlinks for $output/$file"

# link
file="$link"
ln -s "$output/$file" "$output/hand1"
ln -s "$output/$file" "$output/hand2"
ln -s "$output/$file" "$output/pointer"
ln -s "$output/$file" "$output/pointing_hand"
echo "Created symlinks for $output/$file"

# handwriting
file="$hand"
ln -s "$output/$file" "$output/pencil"
echo "Created symlinks for $output/$file"


echo [Icon Theme] >> "$outputRoot/index.theme"
echo Name="$name" >> "$outputRoot/index.theme"
echo Comment=Original by @noiireism >> "$outputRoot/index.theme"
echo Inherits=breeze_cursors >> "$outputRoot/index.theme"
