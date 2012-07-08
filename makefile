E=cv_en
B=aspubs

all: en

en: $E.tex makefile
	latexmk -bibtex -xelatex $E.tex

print: $E.tex makefile
	latexmk -bibtex -xelatex  $E.tex print

clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *_latexmk *-blx.bib *.fls *.run.xml
