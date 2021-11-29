#!/bin/bash

# Some basic tests to make sure ugrep is working fine.

errflag=""
show-errs() {
    if [[ "$errflag" ]]; then
	echo
	echo "*** ERRORS WERE DETECTED ***"
    fi
}
trap show-errs EXIT

runit() {
    # First argument is number of lines of output expected.
    # Remainder are the command to run and its arguments.

    expected="$1"
    shift
    command="$@"
    echo "Running '${command[@]}'"
    output=$(eval ${command[@]})
    lines=$(echo "$output" | wc -l)
    if [[ -z $output ]]; then lines=0; fi
    echo "$output" | expand | sed -e 's#^\(.\{,66\}\).*#    \1#' | head -5 
    if [[ $lines -gt 5 ]]; then echo "    ..."; fi
    if [[ $lines -gt 10 ]]; then 
	echo "$output" | expand | sed -e 's#^\(.\{,66\}\).*#    \1#' | tail -5 
    fi
    if [[ $lines == $expected ]]; then
	echo "    OK ($lines)"
	return 0
    else
	s=$(plural $expected)
	echo -n $'\a'
	echo "*** ERROR: Expected $expected line$s of output, but got $lines"
	sleep 1
	errflag=yup
	return 1
    fi
}

plural() {
    [[ $1 != 1 ]] && echo -n "s"
}

# Literal character  
runit 1 ./ugrep $'\U273F'

# Hex code point
runit 1 ./ugrep 273a

# Character name
runit 81 ./ugrep TETRAGRAM

# Multiple args are joined with .* between
runit 1 ./ugrep math left tort

# Ambiguous arg searches for both hex and charname
runit 3 ./ugrep feed \| grep -i form

# Unambiguous arg searches only hex
runit 1 ./ugrep u+feed

# Regex will not match codepoints not in UnicodeData.txt, such as CJK blocks.
runit 6 ./ugrep U+'.000'

# But codepoints specified explicitly are shown anyway
runit 1 ./ugrep U+8000

# Ranges are specified with two dots. Leading hexits are implied: f -> 240f.
runit 16 ./ugrep 2400..f

# "start..end..increment" (includes CJK blocks)
runit 16 ./ugrep 0..FFFF..1000

# Regex character ranges are faster, but no CJK.
runit 256 ./ugrep U+'[0-9A-F]{2}'
runit 0 ./ugrep U+'8[0-9A-F]{3}'

# -w to match only whole words
runit 4 ./ugrep -w greek.* pi
# 'grep -ivw pi' strips out PI but would allow ethioPIc through
runit 0 ./ugrep -w pi \| grep -ivw pi

# -c to show each characters in a string
runit 5 ./ugrep -c ASCII
runit 4 ./ugrep -c $'x\U0300\U0301\U0302'
runit 21 ./ugrep -c 「⿺辶⿳穴⿰月⿰⿲⿱幺長⿱言馬⿱幺長刂心」

# Search aliases as well as character names
runit 3 ./ugrep backslash \| grep \"REVERSE SOLIDUS\"
