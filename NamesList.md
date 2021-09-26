# About /usr/share/unicode/NamesList.txt

```
@		Food symbols
1F374	FORK AND KNIFE
 		= restaurant, meal
 		* glyph may show a fork and spoon
 		* glyph may show a crossed fork and knife
 		x (fork and knife with plate - 1F37D)
 		x (spoon - 1F944)
```

A supplemental file for UnicodeData.txt. Contains synonyms, cross
references, variations, and commentary. This is where one would find
"EGGPLANT", for example, instead of the official name in
UnicodeData.txt, "AUBERGINE".

Each entry crosses multiple lines, which makes regex search a little
trickier. (Especially since I can't seem to get Python's multiline
support to work). However, there is *plenty* of information available
on how it should be parsed, perhaps too much as the basics can be
grasped just by looking at examples.

* [Latest version of NamesList.txt](http://www.unicode.org/Public/UNIDATA/NamesList.txt).
* [Full specification for the file format](http://www.unicode.org/Public/UCD/latest/ucd/NamesList.html)
* [Simpler overview included in UniBook docs](http://unicode.org/unibook/help/nmlstfmt.htm)

### "NOT MACHINE READABLE"

The NamesList.txt file begins with a header discouraging
machine-reading.


	This file is semi-automatically derived from UnicodeData.txt and
	a set of manually created annotations using a script to select
	or suppress information from the data file. The rules used
	for this process are aimed at readability for the human reader,
	at the expense of some details; therefore, this file should not
	be parsed for machine-readable information.


However, since this data is nowhere else in the Unicode standard, not
only are we forced to parse it, so is the Unicode Consortium itself!
The [Unibook](https://www.unicode.org/unibook/help/unibook.htm)
software Unicode uses to create their character code charts relies on
the machine readability of NamesList.txt.

## Examples

In the following examples ⇥⃞ represents the TAB character and ␠ represents SPACE.


| Character         | Meaning      |
|-------------------|--------------|
| @@⇥⃞START⇥⃞NAME⇥⃞END | Block Header |


Note the START and END character positions surrounding the text of the
block header.


```
@@	0000	C0 Controls and Basic Latin (Basic Latin)	007F
@@+
@		C0 controls
@+		Alias names are those for ISO/IEC 6429:1992. Commonly used alternative aliases are also shown.
0000	<control>
	= NULL
0001	<control>
	= START OF HEADING
0002	<control>
	= START OF TEXT
0003	<control>
	= END OF TEXT
0004	<control>
	= END OF TRANSMISSION
```

| Character | Meaning                |
|-----------|------------------------|
| @⇥⃞⇥⃞LINE   | Subheader              |
| @+⇥⃞⇥⃞LINE  | Notice                 |
| ⇥⃞⇥⃞x␠      | Xref in notice section |

```
@		ASCII punctuation and symbols
@+		Based on ISO/IEC 646.
0020	SPACE
	* sometimes considered a control code
	* other space characters: 2000-200A
	x (no-break space - 00A0)
	x (zero width space - 200B)
	x (narrow no-break space - 202F)
	x (word joiner - 2060)
	x (symbol for space - 2420)
	x (blank symbol - 2422)
	x (open box - 2423)
	x (ideographic space - 3000)
	x (zero width no-break space - FEFF)
```



| Character          | Meaning                | Presentation  |
|--------------------|------------------------|---------------|
| ⇥⃞%␠                | Formal alias           | ※             |
| ⇥⃞=␠                | Alias                  | =             |
| ⇥⃞*␠                | Commentary             | •             |
| ⇥⃞x␠CHAR␠LCNAME     | Cross reference        | → CHAR LCNAME |
| ⇥⃞x␠(LCNAME␠-␠CHAR) | Cross reference        | → CHAR LCNAME |
| ⇥⃞#␠                | Compatibility mapping  | ≈             |
| ⇥⃞:␠                | Decomposition          | ≡             |
| ⇥⃞~␠                | Variant glyph          |               |


```
1D0C5	BYZANTINE MUSICAL SYMBOL FHTORA SKLIRON CHROMA VASIS
	% BYZANTINE MUSICAL SYMBOL FTHORA SKLIRON CHROMA VASIS
	* misspelling of "FTHORA" in character name is a known defect
```

```
0023	NUMBER SIGN
	= pound sign (weight)
	= hashtag, hash
	= crosshatch, octothorpe
	* for denoting musical sharp 266F is preferred
	x (l b bar symbol - 2114)
	x (numero sign - 2116)
	x (viewdata square - 2317)
	x (music sharp sign - 266F)
	x (equals sign and slanted parallel - 29E3)
```

```
0030	DIGIT ZERO
	~ 0030 FE00 short diagonal stroke form
```

```
2052    COMMERCIAL MINUS SIGN
        = abzüglich (German), med avdrag av (Swedish), piska (Swedish, "whip")
        * a common glyph variant and fallback representation looks like ./.
        * may also be used as a dingbat to indicate correctness
        * used in Finno-Ugric Phonetic Alphabet to indicate a related borrowed form with different sound
        x (percent sign - 0025)
        x (arabic percent sign - 066A)
        x (division sign - 00F7)
```

```
1FBB2	LEFT HALF RUNNING MAN
         	* paired with 1FBB3, faces to the right
         	* the Apple II documentation refers to these characters as "Running Man"
         	x (runner - 1F3C3)
```

```
1D1BB	MUSICAL SYMBOL MINIMA
	: 1D1B9 1D165

```

| Character | Meaning                | Presentation |
|-----------|------------------------|--------------|
| @+⇥⃞*␠     | Notice with bullet     | •            |
| ⇥⃞⇥⃞x␠      | Xref in notice section<br/>Applies to whole  | →            |

```
0269	LATIN SMALL LETTER IOTA
	* semi-high front unrounded vowel
@+	* obsoleted by IPA in 1989
	* preferred use is 026A latin letter small capital i
	* uppercase is 0196
	x (greek small letter iota - 03B9)
```

```
@		Accidentals
@+		The most common accidentals are encoded in the Miscellaneous Symbols block.
		x (music flat sign - 266D)
		x (music natural sign - 266E)
		x (music sharp sign - 266F)
1D12A	MUSICAL SYMBOL DOUBLE SHARP
1D12B	MUSICAL SYMBOL DOUBLE FLAT
```




## NamesList.txt Syntax

Here is a simplified understanding which works well enough for our purposes.

Each character on its own line :
	hex⇥⃞charname		      | 1F346	AUBERGINE
				      |
Followed by zero or more lines: |
Synonym:			      |
     ⇥⃞= text[, text...]         |		= eggplant
Commentary on standards	      |
     @+⇥⃞* text		      |	@+	* see ISO 69835 for details
Commentary:		      |
     ⇥⃞* text		      |		* most commonly depicts a penis
Cross reference:		      |
     ⇥⃞x (text - hex)	      |		x (hand with middle finger extended - 1F595)
Variation:		      |
     ⇥⃞# hex... text	      |		# 2642 male sign
     ⇥⃞# <how> hex... 	      |		# <noBreak> 1F34C
Canonical equivalent:	      |
     ⇥⃞: hex text		      | 00C0	LATIN CAPITAL LETTER A WITH GRAVE
				      |		: 0041 0300
Alternate presentation form:    |
     ⇥⃞~ hex... text	      | FF1F    FULLWIDTH QUESTION MARK
				      |	        ~ FF1F FE00 corner-justified form
				      |	        ~ FF1F FE01 centered form
				      |	        # <wide> 003F
				      |
Range: @@⇥⃞start⇥⃞description⇥⃞end | @@	1F650	Ornamental Dingbats	1F67F
Section dividers: @⇥⃞⇥⃞text	      | @		Fleurons
Section comments: @+⇥⃞⇥⃞text      | @+		Fleurons are leaf or floral-shaped ornaments used for text decoration.
				      | 1F650	NORTH WEST POINTING LEAF
				      | 1F651	SOUTH WEST POINTING LEAF


Examples of regulard commentary  and standards commentary:
1E37    LATIN SMALL LETTER L WITH DOT BELOW
        * Indic transliteration
        : 006C 0323
@+      * see ISO 15919 on the use of dot below versus ring below in Indic transliteration
        x (combining ring below - 0325)
2301    ELECTRIC ARROW
@+      * from ISO 2047
        * symbol for End of Transmission

Example of commentary on sections (indented by two tabs):
@               Ceilings and floors
@+              These characters are tall and narrow mathematical delimiters, in contrast to the quine corners or half brackets. They are also distinct from CJK corner brackets, which are wide quotation marks.


Variation Examples:
2007    FIGURE SPACE
	      * space equal to tabular width of a font
	      * this is equivalent to the digit width of fonts with fixed-width digits
	      # <noBreak> 0020
200A    HAIR SPACE
        * thinner than a thin space
        * in traditional typography, the thinnest space available
        # 0020 space
2026    HORIZONTAL ELLIPSIS
        = three dot leader
        x (vertical ellipsis - 22EE)
        x (presentation form for vertical horizontal ellipsis - FE19)
        # 002E 002E 002E
1FBF0   SEGMENTED DIGIT ZERO
        # <font> 0030 digit zero

Canonical equivalent example:
1D164   MUSICAL SYMBOL ONE HUNDRED TWENTY-EIGHTH NOTE
        = semihemidemisemiquaver, quasihemidemisemiquaver
        : 1D15F 1D172

Alternate form example:
2205    EMPTY SET
        = null set
        * used in linguistics to indicate a null morpheme or phonological "zero"
        x (latin capital letter o with stroke - 00D8)
        x (diameter sign - 2300)
        ~ 2205 FE00 zero with long diagonal stroke overlay form

Extended attribute lines attached to section comment:
@               Accidentals
@+              The most common accidentals are encoded in the Miscellaneous Symbols block.
                x (music flat sign - 266D)
                x (music natural sign - 266E)
                x (music sharp sign - 266F)


What does @~ mean? It is always followed by either "⇥⃞!" or
"⇥⃞Standardized Variation Sequences"

007F    <control>
        = DELETE
@~      !
@@      0080    C1 Controls and Latin-1 Supplement (Latin-1 Supplement) 00FF
@               C1 controls
@+              Alias names are those for ISO/IEC 6429:1992.
0080    <control>



All lines that start with @ have one of these prefixes:
 # @⇥⃞⇥⃞			|Section title
 # @+⇥⃞⇥⃞			| Section comment
 # @+⇥⃞*			| Standards comment
 # @@⇥⃞			| Range Title
 # @@+				| [The space intentionally left blank]
 # @~⇥⃞			| "Standardized Variation Sequences"(?)
 # @@@				| Unicode Standard folderol

Ignoring the first 12 lines which are just Unicode prologue,
all lines that start with ⇥⃞ (TAB) have one of these prefixes



### Example of Unicode commentary:
FEFF    ZERO WIDTH NO-BREAK SPACE
        % BYTE ORDER MARK
        = BOM, ZWNBSP
0EA3    LAO LETTER LO LING
        % LAO LETTER RO
        = ro rot
        * name is a mistake, lo ling is the mnemonic for 0EA5
0EA5    LAO LETTER LO LOOT
        % LAO LETTER LO
        = lo ling
        * name is a mistake, lo loot is the mnemonic for 0EA3

### Three entries have abberant use of semicolons instead of commas:
1F70A   ALCHEMICAL SYMBOL FOR VINEGAR
        = crucible; acid; distill; atrament; vitriol; red sulfur; borax; wine; alkali salt; mercurius vivus, quick silver
        x (cross of jerusalem - 2629)
0598    HEBREW ACCENT ZARQA
        = tsinorit, zinorit; tsinor, zinor
        * This character is to be used when Zarqa or Tsinor are placed above, and also for Tsinorit.
        x (hebrew accent zinor - 05AE)
05AE    HEBREW ACCENT ZINOR
        = tsinor; zarqa
        * This character is to be used when Zarqa or Tsinor are placed above left.
        x (hebrew accent zarqa - 0598)

### Maybe should treat semicolons as commas, but that would break this one entry:
29DC    INCOMPLETE INFINITY
        = ISOtech entity &iinfin;
        x (infinity - 221E)





EXAMPLE ENTRIES
