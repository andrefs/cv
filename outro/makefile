E=cv_en
P=cv_pt

all: en pt

en: $E.tex foto.jpg makefile
	pdflatex $E.tex
	pdflatex $E.tex

pt: $P.tex foto.jpg makefile
	pdflatex $P.tex
	pdflatex $P.tex


