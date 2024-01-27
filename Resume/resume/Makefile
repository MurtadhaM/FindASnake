TEXSRC = $(wildcard ./*.tex)

all: main clean rename

rename:
	mv main.pdf  MurtadhaMarzouq-Resume.pdf
main: $(TEXSRC)
#	use pdflatex to compile the tex file
	pdflatex main
clean: 
	\rm -f *.dvi *.aux *.ps *~ *.log *.blg *.bbl *.out *.fls *.fdb_latexmk *.synctex.gz