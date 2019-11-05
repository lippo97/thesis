CC=lualatex
ARGS=-shell-escape
TARGET=struttura.tex
ENV=PLANTUML_JAR=~/jars/plantuml.jar GRAPHVIZ_DOT=/usr/bin/dot

all:
	$(ENV) $(CC) $(ARGS) $(TARGET)

.PHONY: clean

clean:
	$(RM) *.log *.aux *.pdf *-plantuml* *~
