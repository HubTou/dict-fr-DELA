# Installation
pip install [dict-fr-DELA](https://pypi.org/project/dict-fr-DELA/)

# French dictionaries from Laboratoire d'Automatique Documentaire et Linguistique (LADL)

## DESCRIPTION
This package contains several dictionaries processed from [one of those made available](https://infolingu.univ-mlv.fr/DonneesLinguistiques/Dictionnaires/telechargement.html)
by the former [Laboratoire d'Automatique Documentaire et Linguistique](https://infolingu.univ-mlv.fr/LADL/Historique.html) (LADL),
now integrated into [Institut Gaspard Monge](https://igm.univ-gustave-eiffel.fr/) (IGM) of the [Université Gustave Eiffel](https://www.univ-gustave-eiffel.fr/).

The selected dictionary is the inflected form DELA French dictionary in UTF-16 LE encoding, from March 16, 2006, with 683.824 simple entries for 102.073 different lemmas and 108.436 compounded entries for 83.604 different lemmas.

## FILES
All files are installed in Python's */usr/local* equivalent, under *share/dict*.

### Original files

Filename|Description
---|---
dict-fr-DELA|792.120 entries inflected form DELA French dictionary
dict-fr-DELA-License|Lesser General Public License For Linguistic Resources

The dict-fr-DELA file has undergone the following transformations:
* conversion from UTF-16 LE to UTF-8
* removal of MS-DOS end of lines
* sort & removal of duplicates

### Generated files

Filename|Description
---|---
dict-fr-DELA.ascii|French words and compound words list (unaccented)
dict-fr-DELA.unicode|742.889 entries French words and compound words list (accented)
dict-fr-DELA.combined|French words and compound words list (with both accented and unaccented words)
dict-fr-DELA-proper_nouns.ascii|French proper nouns list (unaccented, sometimes compounded)
dict-fr-DELA-proper_nouns.unicode|823 entries French proper nouns list (accented, sometimes compounded)
dict-fr-DELA-proper_nouns.combined|French proper nouns list (with both accented and unaccented words, sometimes compounded)
dict-fr-DELA-common-words.ascii|French common words list (unaccented)
dict-fr-DELA-common-words.unicode|641.759 entries French common words list (accented)
dict-fr-DELA-common-words.combined|French common words list (with both accented and unaccented words)
dict-fr-DELA-common-compound-words.ascii|French common compound words list (unaccented)
dict-fr-DELA-common-compound-words.unicode|100.320 entries French common compound words list (accented)
dict-fr-DELA-common-compound-words.combined|French common compound words list (with both accented and unaccented words)

These generated files went through the following transformations:
* removal of escape backslashes
* removal of lemma and grammatical info from dict-fr-DELA
* lossless conversion of accents for the *\*-ascii* versions
* combination of the *\*-ascii* and *\*-unicode* versions into the *\*-combined* ones (without duplicates)

## SEE ALSO
[spell(1)](https://www.freebsd.org/cgi/man.cgi?query=spell) like tools,
[anagram(6)](https://github.com/HubTou/anagram/blob/main/README.md),
[conjuguer(1)](https://github.com/HubTou/conjuguer/blob/main/README.md)

## HISTORY
DELA means "Dictionnaire Electronique du LADL" (LADL's electronic dictionaries). These dictionaries were initiated by the lab's founder, [Maurice Gross](https://fr.wikipedia.org/wiki/Maurice_Gross).

This package of data files was originally intended to be used with the [PNU project](https://github.com/HubTou/PNU)'s
[conjuguer](https://github.com/HubTou/conjuguer) command, as well as many other text processing tools.

I wrote an [history of Unix & French dictionaries](https://github.com/HubTou/PNU/wiki/Les-dictionnaires-sous-Unix) (in French only),
which covers this dictionary and many others.

## LICENSE
The original contents, as well as this package, are licensed under the [Lesser General Public License For Linguistic Resources](http://infolingu.univ-mlv.fr/DonneesLinguistiques/Lexiques-Grammaires/lgpllr.html).

## AUTHORS
[Laboratoire d'Automatique Documentaire et Linguistique](https://infolingu.univ-mlv.fr/LADL/Historique.html) (LADL) for the original contents.

[Hubert Tournier](https://github.com/HubTou) for the package.

