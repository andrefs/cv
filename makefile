E=cv_en
P=cv_pt
B=aspubs
M=motiv_letter_en
L=motiv_letter_pt

all: en pt let

en: $E.tex foto.jpg makefile
	pdflatex $E.tex
	bibtex $E
	pdflatex $E.tex

pt: $P.tex foto.jpg makefile
	pdflatex $P.tex
	bibtex $P
	pdflatex $P.tex

ptlet: $L.tex
	pdflatex $L.tex
	pdflatex $L.tex

enlet: $M.tex
	pdflatex $M.tex
	pdflatex $M.tex

check:
	aspell -l en -c -t *.tex
