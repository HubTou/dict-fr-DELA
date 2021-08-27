BASE=dela-fr-public
DIC=${BASE}.dic
ZIP=${BASE}.zip
URL=http://infolingu.univ-mlv.fr/DonneesLinguistiques/Dictionnaires/${ZIP}

# Default action is to show this help message:
.help:
	@echo "Possible targets:"
	@echo "  package        Build package"
	@echo "  upload-test    Upload the package to TestPyPi"
	@echo "  upload         Upload the package to PyPi"
	@echo "  clean          Remove all downloaded files"
	@echo "  distclean      Remove all generated files as well"

dict-fr-DELA:
	@echo "=> Downloading source file"
	@( cd data ; fetch -q ${URL} )
	@echo "=> Unzipping source file"
	@( cd data ; unzip -q ${ZIP} )
	@echo "=> Converting source file to UTF-8 / Unix end of lines / no duplicates"
	@( cd data ; iconv -f UTF-16 -t UTF-8 ${DIC} | sed "s///" | sort | uniq > dict-fr-DELA )
	@echo "=> Producing the full dictionary"
	@( cd data ; sed -e "s/\\\\,/~/g" -e "s/,/	/g" -e "s/~/,/g" -e "s/\\\\//g" dict-fr-DELA > dict-fr-DELA.tmp )
	@( cd data ; cut -f1 dict-fr-DELA.tmp | sort | uniq | tee dict-fr-DELA.unicode | unicode2ascii | sort | uniq > dict-fr-DELA.ascii )
	@( cd data ; cat dict-fr-DELA.unicode dict-fr-DELA.ascii | sort | uniq > dict-fr-DELA.combined )
	@echo "=> Producing the proper nouns dictionaries"
	@( cd data ; grep "+NPropre" dict-fr-DELA.tmp | cut -f1 | sort | uniq | tee dict-fr-DELA-proper_nouns.unicode | unicode2ascii | sort | uniq > dict-fr-DELA-proper_nouns.ascii )
	@( cd data ; cat dict-fr-DELA-proper_nouns.unicode dict-fr-DELA-proper_nouns.ascii | sort | uniq > dict-fr-DELA-proper_nouns.combined )
	@echo "=> Producing the common compound words dictionaries"
	@( cd data ; grep -v "+NPropre" dict-fr-DELA.tmp | cut -f1 | sort | uniq > dict-fr-DELA.tmp2 )
	@( cd data ; grep " " dict-fr-DELA.tmp2 | tee dict-fr-DELA-common-compound_words.unicode | unicode2ascii | sort | uniq > dict-fr-DELA-common-compound_words.ascii)
	@( cd data ; cat dict-fr-DELA-common-compound_words.unicode dict-fr-DELA-common-compound_words.ascii | sort | uniq > dict-fr-DELA-common-compound_words.combined )
	@echo "=> Producing the common words dictionaries"
	@( cd data ; grep -v " " dict-fr-DELA.tmp2 | tee dict-fr-DELA-common-words.unicode | unicode2ascii | sort | uniq > dict-fr-DELA-common-words.ascii)
	@( cd data ; cat dict-fr-DELA-common-words.unicode dict-fr-DELA-common-words.ascii | sort | uniq > dict-fr-DELA-common-words.combined )

love:
	@echo "Not war!"

package: dict-fr-DELA clean
	python -m build

upload-test:
	python -m twine upload --repository testpypi dist/*

upload:
	python -m twine upload dist/*

clean:
	@echo "=> Removing intermediate files"
	@( cd data ; rm -f ${DIC} ${ZIP} *tmp* )

distclean: clean
	@echo "=> Removing generated files"
	@( cd data ; rm -f dict-fr-DELA *ascii *unicode *combined )
	@rm -rf build dist *.egg-info

