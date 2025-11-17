#!/bin/bash

CORPUS="$1"
DICTIONARY="../uz_UZ"

TOTAL=$(wc -w --total=only $CORPUS)
COUNT=$(hunspell -d $DICTIONARY -l $CORPUS | wc -l)

RESULT=$(echo "scale=2; ($TOTAL - $COUNT)*100/$TOTAL" | bc)

echo "Coverage: $RESULT%"