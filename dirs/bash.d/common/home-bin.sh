# Add ${HOME}/bin to PATH, if it exists.
TADDPATH="${HOME}/bin"
if [ -d "$TADDPATH" ]; then
	TPATH=""

	if [ $(echo $PATH|grep -c "$TADDPATH") == "0" ]; then
		TPATH="$PATH:$TADDPATH"
	fi

	[[ -n "$TPATH" ]] && export PATH="$TPATH"

	unset TPATH
fi
unset TADDPATH
