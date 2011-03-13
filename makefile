E=cv_en
P=cv_pt
B=aspubs
L=motiv_letter

all: en pt let

en: $E.tex foto.jpg makefile
	pdflatex $E.tex
	bibtex $E
	pdflatex $E.tex

pt: $P.tex foto.jpg makefile
	pdflatex $P.tex
	bibtex $P
	pdflatex $P.tex

let: $L.tex
	pdflatex $L.tex
	pdflatex $L.tex

check:
	aspell -l en -c -t *.tex
