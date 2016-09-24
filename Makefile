all: latex101.pdf

latex101.pdf: latex101.tex
	pdflatex -interaction=nonstopmode latex101

%-4up.pdf: %.pdf
	pdfnup -q --nup 2x2 --suffix '4up' $<

h.pdf: latex101.tex
	pdflatex -jobname='h' -interaction=nonstopmode \
	'\newcommand{\handouts}{true}\input{latex101.tex}'

.PHONY: clean

clean:
	rm -fr latex101.pdf
