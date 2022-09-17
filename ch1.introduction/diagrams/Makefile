DIAGRAMS :=

.PHONY: all
all: $(patsubst %.tex,%.pdf,$(DIAGRAMS))

%.pdf: %.tex
	latexmk -outdir=build -pdf $^

.PHONY: clean
clean:
	latexmk -outdir=build -C $(DIAGRAMS)
