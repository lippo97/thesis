CC=pdflatex
BIB=bibtex
ARGS=--shell-escape
TARGET=main.tex
ENV=

PUMLCC=plantuml
PUMLFORMAT=-tpng
PUMLSRC_DIR=diagrams
PUMLOUT_DIR=output
PUML_TARGETS=$(patsubst $(PUMLSRC_DIR)/%.puml, \
			$(PUMLSRC_DIR)/$(PUMLOUT_DIR)/%.png, \
			$(wildcard $(PUMLSRC_DIR)/*.puml))

define RMTARGET
*.log \
*.aux \
*.pdf \
*-plantuml* \
*~ *.bbl \
*.blg \
*.out \
*.toc \
*.idx \
diagrams/output/*
endef

all: bibliography
	$(ENV) $(CC) $(ARGS) $(TARGET)
	$(ENV) $(CC) $(ARGS) $(TARGET)

bibliography: pre-bibliography
	$(BIB) $(basename $(TARGET))

pre-bibliography:
	$(ENV) $(CC) $(ARGS) $(TARGET)

one: diagrams
	$(ENV) $(CC) $(ARGS) $(TARGET)

diagrams: $(PUML_TARGETS)

$(PUMLSRC_DIR)/$(PUMLOUT_DIR)/%.png: $(PUMLSRC_DIR)/%.puml
	$(PUMLCC) $(PUMLFORMAT) $(basename $^).puml -o$(PUMLOUT_DIR)

.PHONY: clean bibliography pre-bibliography diagrams

clean:
	$(RM) $(RMTARGET)
