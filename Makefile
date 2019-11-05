TARGET=struttura.tex

all:
	pdflatex $(TARGET)


.PHONY: clean

clean:
	rm struttura.tex~ struttura.log struttura.aux struttura.pdf
