SOURCES := ../thesis.tex \
			chapter.tex

.PHONY: all
all: chapter.pdf

chapter.pdf: $(SOURCES) diagrams ../conf.tex
	latexmk -outdir=build -pdf chapter.tex

../conf.tex: $(wildcard ../conf/*.tex)
	$(MAKE) -C .. conf.tex

.PHONY: diagrams
diagrams: $(wildcard diagrams/*.tex)
	$(MAKE) -C diagrams

.PHONY: clean
clean:
	latexmk -outdir=build -C chapter.tex
