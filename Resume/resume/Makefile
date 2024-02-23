TEXSRC = $(wildcard ./*.tex)

all: main clean rename

rename:
		move main.pdf  MurtadhaMarzouq-Resume.pdf"
main: $(TEXSRC)
		pdflatex main.tex
clean: 
		echo "Cleaning up..."
		del "*.aux" "*.log" "*.out" "*.toc"  