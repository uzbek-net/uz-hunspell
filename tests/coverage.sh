#!/bin/bash

CORPUS="$1"
DICTIONARY="../uz_UZ"

TOTAL=$(wc -w --total=only $CORPUS)
COUNT=$(hunspell -d $DICTIONARY -l $CORPUS | wc -l)

RESULT=$(echo "scale=2; ($TOTAL - $COUNT)*100/$TOTAL" | bc)

UNIQUE_TOTAL=$(tr -s '[:space:]' '\n' < $CORPUS | sort | uniq | wc -w --total=only)
UNIQUE_COUNT=$(hunspell -d $DICTIONARY -l $CORPUS | sort | uniq | wc -l)

UNIQUE_RESULT=$(echo "scale=2; ($UNIQUE_TOTAL - $UNIQUE_COUNT)*100/$UNIQUE_TOTAL" | bc)

echo "Coverage: $RESULT%"
echo "Unique coverage: $UNIQUE_RESULT%"