#!/bin/sh
docker run --rm -it -v $PWD:/source xabufr/pandoc-latex-make-docker /bin/sh -c "make $1 && make clean && chmod 777 *.pdf"
