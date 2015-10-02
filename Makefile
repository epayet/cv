ALL: cv.pdf

cv.pdf: out/cv.pdf
	cp out/cv.pdf cv.pdf

out/cv.pdf: cv.tex
	mkdir -p out/
	pdflatex -output-directory=out cv.tex

clean:
	rm -rf out/

clean-all: clean
	rm -f cv.pdf

view: cv.pdf
	xdg-open cv.pdf
