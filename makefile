E=cv_en
B=aspubs

all: en

en: $E.tex makefile
	latexmk -bibtex -enc -etex -xelatex $E.tex
#	mv $E.pdf $E_color.pdf

# print: $E.tex makefile
# 	#latexmk -bibtex -xelatex  -latex="\def\grayflag{}\input{$E.tex}"
# 	latexmk -bibtex -xelatex $E.tex
# 	mv $E.pdf $E_gray.pdf
# 
# printbw: $E.tex makefile
# 	#latexmk -bibtex -xelatex  -latex="\def\bwflag{}\input{$E.tex}"
# 	latexmk -bibtex -xelatex $E.tex
# 	mv $E.pdf $E_bw.pdf

clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *_latexmk *-blx.bib *.fls *.run.xml
