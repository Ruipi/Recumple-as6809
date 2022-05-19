#/bin/bash

LONGITUD=0
grep "^S1" | (while read
do
	L=${REPLY:2:2}
	let LONGITUD+=$((16#$L-3))
done

echo $LONGITUD
)
