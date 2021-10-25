<a href="https://raw.githubusercontent.com/hackerb9/ugrep/master/README.md.d/screenshot.png">
<img title="ugrep screenshot" alt-text="Example of ugrep vine" align="right" src="README.md.d/screenshot.png" width="50%">
</a>

# ☙ ugrep ❧

_Find unicode characters based on their names_

ugrep is essentially [grep](https://www.gnu.org/software/grep/) for
the Unicode table. It prints out the resulting unicode characters
literally, so you can easily cut-and-paste. Ugrep is useful for
looking up Emojis 😤, finding obscure symbols ⚸⅗ℏ℞☧☭, or beautiful
glyphs to decorate your text. 🙶❡✯🟔❢🙷

You can also use it for the reverse operation to lookup a single
character (or a string of them) you've pasted into the terminal.

As a bonus, it can also show what fonts are installed that can render
a particular unicode character.

## Installation

It's just a Python 3 shell script. Download it to `/usr/local/bin` or `~/bin`
and make it executable.

    cd /usr/local/bin
    wget https://github.com/hackerb9/ugrep/raw/master/ugrep
    chmod +x ugrep

## Usage

* Search by name: **ugrep** [**-w**] _regex_

	Look up a character name where _regex_ is a regular
	expression. If you don't know [regular
	expressions](https://docs.python.org/3/howto/regex.html),
	don't worry. Just use plain strings and you'll rarely be
	wrong.

	    ugrep runic

	If you find ugrep returning too many hits because the phrase you used
	is found in other terms, e.g., _thema_ found in _mathematical_, use
	the **-w** option to limit the search to complete words.

* Search by number: **ugrep** _codepoint_**[..**_codepoint_]

	Look up a character (or a range of them) using Unicode code points in
	hexadecimal. For example,

	    ugrep 23b0..f

* Search by character: **ugrep** [**-c**] _character string_

	Look up each character in a string. Note that if the string is a
	single character, e.g., `ugrep X`, then **-c** is implied and need not
	be specified.

	    ugrep -c "(ﾟ∀ﾟ)"

* List fonts for a character: **ugrep** [**-l**] _character_

	After showing the character, list installed fonts that have that
    glyph:

	    ugrep -l ohm

### Examples:

Note: output from all examples has been excerpted. (You'd be amazed
how many heart emojis Unicode has. 😜)

* Plain text search is simple:

	    $ ugrep heart
	    ☙	U+2619	REVERSED ROTATED FLORAL HEART BULLET
	    ❣	U+2763	HEAVY HEART EXCLAMATION MARK ORNAMENT
	    ❤	U+2764	HEAVY BLACK HEART
	    ⋮	[ ... truncated for brevity ... ]
	    💞	U+1F49E REVOLVING HEARTS
	    💟	U+1F49F HEART DECORATION
	    😍	U+1F60D SMILING FACE WITH HEART-SHAPED EYES
	    😻	U+1F63B	SMILING CAT FACE WITH HEART-SHAPED EYES

* Paste in a single character to lookup its codepoint:

	    $ ugrep ☺
	    ☺       U+263A  WHITE SMILING FACE

* Arguments on the command line have an implicit wildcard between them:

	    $ ugrep right.*gle
	    $ ugrep right gle       # Equivalent
	    »	U+00BB	RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
	    ’	U+2019	RIGHT SINGLE QUOTATION MARK
	    ∟	U+221F	RIGHT ANGLE
	    ⊿	U+22BF	RIGHT TRIANGLE

* You can use regular expressions for fancier searches: 

	    $ ugrep -w '(wo|hu)?m(a|e)ns?'
	    ᛗ	U+16D7	RUNIC LETTER MANNAZ MAN M
	    ⛀	U+26C0	WHITE DRAUGHTS MAN
	    ⛂	U+26C2	BLACK DRAUGHTS MAN
	    ⼈	U+2F08	KANGXI RADICAL MAN
	    ⼥	U+2F25	KANGXI RADICAL WOMAN
	    𝌂	U+1D302	DIGRAM FOR HUMAN EARTH
	    𝌄	U+1D304	DIGRAM FOR EARTHLY HUMAN
	    🕴	U+1F574	MAN IN BUSINESS SUIT LEVITATING
	    🕺	U+1F57A	MAN DANCING
	    🚹	U+1F6B9	MENS SYMBOL
	    🚺	U+1F6BA	WOMENS SYMBOL
	    🤰	U+1F930	PREGNANT WOMAN
	    🤵	U+1F935	MAN IN TUXEDO
	    
	    $ ugrep ^x		    #  Regex anchors ^ and $ work
	    ⊻	U+22BB	XOR
	    ⌧	U+2327	X IN A RECTANGLE BOX (clear key)

* Use the `-w` flag to search only for complete words:

	    $ ugrep -w R	    # The letter R used as a word
	    $ ugrep "\bR\b"	    # (regex equivalent)
	    R	U+0052	LATIN CAPITAL LETTER R
	    Ŗ	U+0156	LATIN CAPITAL LETTER R WITH CEDILLA
	    ℛ	U+211B	SCRIPT CAPITAL R (Script r)
	    ℜ	U+211C	BLACK-LETTER CAPITAL R (Black-letter r)
	    ℝ	U+211D	DOUBLE-STRUCK CAPITAL R (Double-struck r)

* Use -c to display info for each character in a string.

        $ ugrep -c "ᕕ( ᐛ )ᕗ"
        ᕕ   U+1555  CANADIAN SYLLABICS FI
        (   U+0028  LEFT PARENTHESIS (opening parenthesis)
            U+0020  SPACE
        ᐛ   U+141B  CANADIAN SYLLABICS NASKAPI WAA
            U+0020  SPACE
        )   U+0029  RIGHT PARENTHESIS (closing parenthesis)
        ᕗ   U+1557  CANADIAN SYLLABICS FO

* Aliases (alternate names) are also searched:

	    $ ugrep backslash
	    \	U+005C	REVERSE SOLIDUS (backslash)

* Browse through a range of Unicode characters:

	    $ ugrep 26b3..b
	    ⚳	U+26B3	CERES
	    ⚴	U+26B4	PALLAS
	    ⚵	U+26B5	JUNO
	    ⚶	U+26B6	VESTA
	    ⚷	U+26B7	CHIRON
	    ⚸	U+26B8	BLACK MOON LILITH
	    ⚹	U+26B9	SEXTILE
	    ⚺	U+26BA	SEMISEXTILE
	    ⚻	U+26BB	QUINCUNX

	    $ ugrep 1f470..ff
	    👰	U+1F470	BRIDE WITH VEIL
	    👱	U+1F471	PERSON WITH BLOND HAIR
	    👲	U+1F472	MAN WITH GUA PI MAO
	    👳	U+1F473	MAN WITH TURBAN
	    👴	U+1F474	OLDER MAN
	    👵	U+1F475	OLDER WOMAN
	    👶	U+1F476	BABY
	    👷	U+1F477	CONSTRUCTION WORKER
	    👸	U+1F478	PRINCESS
	    👹	U+1F479	JAPANESE OGRE
	    👺	U+1F47A	JAPANESE GOBLIN
	    👻	U+1F47B	GHOST
	    👼	U+1F47C	BABY ANGEL
	    👽	U+1F47D	EXTRATERRESTRIAL ALIEN
	    ⋮	[ ... truncated for brevity ... ]
	    📼	U+1F4FC	VIDEOCASSETTE
	    📽	U+1F4FD	FILM PROJECTOR
	    📾	U+1F4FE	PORTABLE STEREO
	    📿	U+1F4FF	PRAYER BEADS

* List which installed fonts have the "mho" glyph defined:

	    $ ugrep -l mho 
		℧    U+2127  INVERTED OHM SIGN (mho)
					 DejaVu Math TeX Gyre
					 DejaVu Sans Book
					 DejaVu Serif Book
					 EB Garamond 12
					 FreeMono
					 FreeSans
					 FreeSerif
					 MathJax_AMS
					 Noto Sans Mono
					 Noto Sans
					 Noto Serif
					 OpenSymbol
					 Symbola
					 TakaoPGothic

  Note that for this to work, you'll need a machine that has
  FontConfig installed. (Most GNU/Linux machines should already be set).
  
  Additionally, the requested character will be displayed in each of
  the typefaces if your terminal supports sixel graphics (e.g., `xterm
  -ti vt340`) and you have ImageMagick installed.

* View _all_ Unicode characters:

	    $ ugrep 0..10FFFF  |  less		# ugrep ".?" is equivalent.
	    ⋮	[ ... over 30,000 glyphs elided for brevity ... ]

	Sometimes it's useful (or fun) to page through the Unicode
	table and see what characters are defined in a region. (Tip:
	search for a code point in `less` by pressing `/U\+A60F`).

### Fun things to try:

To see some useful and lovely glyphs, try this:

    ugrep face 
    ugrep alchemical 
    ugrep ornament
    ugrep bullet
    ugrep '(vine|bud)'
    ugrep vai
    ugrep heavy
    ugrep drawing
    ugrep combining

## UnicodeData.txt

If your system has the file
[UnicodeData.txt](https://unicode.org/Public/UNIDATA/UnicodeData.txt)
installed, ugrep will use it instead of the copy cached inside the script. 
You can install it in several ways.

**Easiest**: On Ubuntu and Debian GNU/Linux, simply `apt install unicode-data`.

**Still easy**: Or, you can download it by hand from
[unicode.org](https://unicode.org/Public/UNIDATA/UnicodeData.txt)
and place it in `~/.local/share/unicode/UnicodeData.txt`

**Not hard**: Or, if you wish the file to be accessible to all users on
your machine, place it in `/usr/local/share/unicode/UnicodeData.txt`.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

## Boring Implementation notes

This is a rewrite of b9's AWK ugrep into Python. While AWK makes more
sense for what this program does (comparing fields based on regexps),
a rewrite was necessary because GNU awk, while plenty powerful, uses
`\y` for word edges instead of the standard `\b`. Gawk does this for
backwards compatibility with historic AWK, but lacks a way to disable
it for new scripts.

Switching to Python did have the benefit of allowing more powerful
Perlesque regexes (not that anyone has requested that).

### Why not use unicodedata module?

I do not use Python's `unicodedata` module because it is woefully
insufficient. It allows one to search by character name only by
specifying it fully and exactly: `unicodedata.lookup("ROTATED HEAVY
BLACK HEART BULLET")`.

## Future Work

### Maybe use NamesList.txt

It looks like
[`NamesList.txt`](https://unicode.org/Public/UNIDATA/NamesList.txt)
might be useful to also parse as it allows multiple aliases for a
character. For example (from `grep -B1 [=%] NamesList.txt`):

    0023    NUMBER SIGN
            = pound sign, hash, crosshatch, octothorpe

    002E    FULL STOP
            = period, dot, decimal point
    --
    002F    SOLIDUS
            = slash, virgule

    1F70A   ALCHEMICAL SYMBOL FOR VINEGAR
            = crucible; acid; distill; atrament; vitriol; red
              sulfur; borax; wine; alkali salt; mercurius vivus,
              quick silver

I'm not sure how useful this will be (who is going to look up the
number sign by searching on "octothorpe"), but it'd be nice to be able
to at least show them as aliases.

Also, NamesList.txt has a fascinating "cross reference" feature:

    0021    EXCLAMATION MARK
            = factorial
            = bang
            x (inverted exclamation mark - 00A1)
            x (latin letter retroflex click - 01C3)
            x (double exclamation mark - 203C)
            x (interrobang - 203D)
            x (heavy exclamation mark ornament - 2762)

How would one find the interrobang (‽) without such a cross reference?

Note that the NamesList.txt file actually starts with a warning *not*
to parse it as it says it is generated mechanically from
UnicodeData.txt plus "manually created annotations". However, those
annotations are what is interesting about the file (the aliases and
cross references) and there appears to be no other official source of
that data.


## Bugs, Misfeatures, and Workarounds

## Bugs, Misfeatures, and Workarounds

* The following is not a problem for people who are willing to use
  vector fonts (truetype, opentype, postscript) that may be
  antialiased. Xterm uses fontconfig for such people. 

  Xterm (as of version 369) seems to be able to only show one bitmap
  font at a time, which means a single font must have all the glyphs
  you want shown. (Yes, you can have a second bitmap font for "wide"
  CJK, but that's still not enough.)

  The author (hackerb9) currently prefers using the Neep bitmap font
  like so in `~/.Xresources`:

      ! Neep looks nice, has good unicode coverage. Requires xfonts-jmk.
      xterm*vt100.font        :       *neep-medium-r-normal--20*10646*
      ! Neep lacks Asian characters
      xterm*vt100.wideFont    :       *fixed-medium-r-normal-ja-18*10646*

  Neep has two major downsides. 1. It is a bitmap font with only one
  size well implemented, so you can't zoom in or out. 2. It is limited
  to 65536 characters, which means it cannot show characters outside
  of Unicode's Basic Multilingual Plane, such as new emojis. Neep can
  be installed on Debian GNU/Linux systems with `apt install
  xfonts-jmk`.

* Mlterm appears to have the same single font limitation as Xterm.
  Also, it right aligns text that has even a single character in a
  right-to-left alphabet, such as Arabic, so the output from ugrep
  will look a little funny.

* Gnome-terminal uses `font-config`, so it has very nice Unicode
  support and can easily zoom in with Ctrl-+⃣ and Ctrl--⃣.
  Unfortunately, older versions had a bug where combining characters
  were combined with the following character instead of the previous.
  Note that Xterm and mlterm handle this correctly.

