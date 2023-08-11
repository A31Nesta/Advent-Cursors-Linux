#! /bin/sh
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
output="$HOME/.icons/KosekiBijouCursor/cursors"
outputRoot="$HOME/.icons/KosekiBijouCursor"

if [ ! -d ${output} ]
then
	mkdir -p "$output"
fi

${VENV}/bin/win2xcur "$dir"/*.ani -o "$output"
${VENV}/bin/win2xcur "$dir"/*.cur -o "$output"

echo "Directory was converted successfully"

# create symlinks
# default
file="Bijou normal"
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
file="Bijou text"
ln -s "$output/$file" "$output/text"
ln -s "$output/$file" "$output/xterm"
ln -s "$output/$file" "$output/ibeam"
echo "Created symlinks for $output/$file"

# size_hor
file="Bijou horz"
ln -s "$output/$file" "$output/size_hor"
ln -s "$output/$file" "$output/w-resize"
ln -s "$output/$file" "$output/ew-resize"
ln -s "$output/$file" "$output/e-resize"
ln -s "$output/$file" "$output/h_double_arrow"
ln -s "$output/$file" "$output/sb_h_double_arrow"
echo "Created symlinks for $output/$file"

# size_ver
file="Bijou vert"
ln -s "$output/$file" "$output/size_ver"
ln -s "$output/$file" "$output/n-resize"
ln -s "$output/$file" "$output/ns-resize"
ln -s "$output/$file" "$output/s-resize"
ln -s "$output/$file" "$output/v_double_arrow"
ln -s "$output/$file" "$output/sb_v_double_arrow"
echo "Created symlinks for $output/$file"

# move
file="Bijou move"
ln -s "$output/$file" "$output/all-scroll"
ln -s "$output/$file" "$output/fleur"
ln -s "$output/$file" "$output/size_all"
echo "Created symlinks for $output/$file"

# size_bdiag
file="Bijou dgn2"
ln -s "$output/$file" "$output/size_bdiag"
ln -s "$output/$file" "$output/ne-resize"
ln -s "$output/$file" "$output/nesw-resize"
ln -s "$output/$file" "$output/sw-resize"
echo "Created symlinks for $output/$file"

# size_fdiag
file="Bijou dgn1"
ln -s "$output/$file" "$output/size_fdiag"
ln -s "$output/$file" "$output/nw-resize"
ln -s "$output/$file" "$output/nwse-resize"
ln -s "$output/$file" "$output/se-resize"
echo "Created symlinks for $output/$file"

# progress
file="Bijou work"
ln -s "$output/$file" "$output/progress"
ln -s "$output/$file" "$output/half-busy"
ln -s "$output/$file" "$output/left_ptr_watch"
echo "Created symlinks for $output/$file"

# wait
file="Bijou busy"
ln -s "$output/$file" "$output/wait"
ln -s "$output/$file" "$output/watch"
echo "Created symlinks for $output/$file"
	
# not_allowed
file="Bijou unavailable"
ln -s "$output/$file" "$output/not-allowed"
ln -s "$output/$file" "$output/crossed_circle"
ln -s "$output/$file" "$output/circle"
# no_drop
ln -s "$output/$file" "$output/no-drop"
ln -s "$output/$file" "$output/forbidden"
echo "Created symlinks for $output/$file"

# precision
file="Bijou precision"
ln -s "$output/$file" "$output/crosshair"
ln -s "$output/$file" "$output/tcross"
ln -s "$output/$file" "$output/cross"
echo "Created symlinks for $output/$file"
	
# help
file="Bijou help"
ln -s "$output/$file" "$output/help"
ln -s "$output/$file" "$output/left_ptr_help"
ln -s "$output/$file" "$output/question_arrow"
ln -s "$output/$file" "$output/whats_this"
echo "Created symlinks for $output/$file"

# link
file="Bijou link"
ln -s "$output/$file" "$output/hand1"
ln -s "$output/$file" "$output/hand2"
ln -s "$output/$file" "$output/pointer"
ln -s "$output/$file" "$output/pointing_hand"
echo "Created symlinks for $output/$file"

# handwriting
file="Bijou hand"
ln -s "$output/$file" "$output/pencil"
echo "Created symlinks for $output/$file"


echo [Icon Theme] >> "$outputRoot/index.theme"
echo Name=Koseki Bijou Cursor >> "$outputRoot/index.theme"
echo Comment=Original by @noiireism >> "$outputRoot/index.theme"
echo Inherits=breeze_cursors >> "$outputRoot/index.theme"
