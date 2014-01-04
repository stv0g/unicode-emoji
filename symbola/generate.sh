#!/bin/bash

cat symbols.txt | while read SYM; do
	FSYM=""
	for SSYM in ${SYM}; do
		FSYM=${FSYM}$(perl -C -e "print chr 0x${SSYM}")
	done

	convert -size 25x25 \
		xc:none \
		-fill black \
		-font Symbola \
		-gravity center \
		-pointsize 25 \
		-annotate +0+0 "${FSYM}" \
		PNG:"${SYM,,}.png"
done
