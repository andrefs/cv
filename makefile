E=cv_en
B=aspubs
M=motiv_letter_pt

all: en ptlet

en: $E.tex foto.jpg makefile
	pdflatex $E.tex
	bibtex $E
	pdflatex $E.tex
	pdflatex $E.tex

ptlet: $M.tex
	pdflatex $M.tex
	pdflatex $M.tex

check:
	aspell -l en -c -t *.tex

clean:
	rm -rf *.aux *.bbl *.blg *.log *.out 
