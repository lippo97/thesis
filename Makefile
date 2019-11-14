CC=lualatex
BIB=bibtex
ARGS=-shell-escape
TARGET=main.tex
ENV=PLANTUML_JAR=~/jars/plantuml.jar GRAPHVIZ_DOT=/usr/bin/dot

all: bibliography
	$(ENV) $(CC) $(ARGS) $(TARGET)
	$(ENV) $(CC) $(ARGS) $(TARGET)

bibliography: pre-bibliography
	$(BIB) $(basename $(TARGET))

pre-bibliography:
	$(ENV) $(CC) $(ARGS) $(TARGET)

one:
	$(ENV) $(CC) $(ARGS) $(TARGET)

.PHONY: clean bibliography pre-bibliography

clean:
	$(RM) *.log *.aux *.pdf *-plantuml* *~ *.bbl *.blg *.out *.toc
