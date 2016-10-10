all: latex101.pdf

latex101.pdf: latex101.tex
	pdflatex -interaction=nonstopmode latex101

## intro-tex.pdf is a formatted version of the .tex input file.
latex101-tex.pdf: latex101.tex
	a2ps $^ -o - | ps2pdf - > $@

%-4up.pdf: %.pdf
	pdfnup -q --nup 2x2 --suffix '4up' $<

h.pdf: latex101.tex
	pdflatex -jobname='h' -interaction=nonstopmode \
	'\newcommand{\handouts}{true}\input{latex101.tex}'

.PHONY: clean

clean:
	rm -fr latex101.pdf
