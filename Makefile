COMPILE_PROGRAM = pdflatex
COMPILE_COMMAND = $(COMPILE_PROGRAM) -interaction=errorstopmode -halt-on-error

VERSIONS = $(basename $(notdir $(wildcard versions/*.tex)))
VERSIONS_OUT = $(addprefix build/,$(wildcard versions/*.tex))
CVS = $(addprefix cv-,$(addsuffix .pdf,$(VERSIONS)))
TEX = cv.tex

all: $(CVS)

cv-%.pdf: versions/%.tex $(SCHEMAS_OUT)
	$(eval $@_NAME := $(notdir $(basename $<)))
	mkdir -p build/versions
	cp $< build/$<
	cp content/* build
	cd build && \
	$(COMPILE_COMMAND) --jobname=$($@_NAME) cv.tex && \
	$(COMPILE_COMMAND) --jobname=$($@_NAME) cv.tex
	mkdir -p out
	mv build/$($@_NAME).pdf out/cv-$($@_NAME).pdf

clean: 
	rm -rf build/

clean_all: clean
	rm -rf out/
