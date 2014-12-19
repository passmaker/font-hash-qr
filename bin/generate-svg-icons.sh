#!/bin/bash

OUT_DIR="$(dirname $0)/../target/svg"
COMBINAISONS=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})

rm -rf $OUT_DIR
mkdir -p $OUT_DIR

for i in {0..511} ; do
  out=$OUT_DIR/${i}.svg
  combinaison=${COMBINAISONS[$i]}
  echo $combinaison	$i
  cat > $out << EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg width="3" height="3" xmlns="http://www.w3.org/2000/svg">
 <style>
  rect.dot {
   stroke: black;
   stroke-width: 0.05;
   stroke-opacity: 1;
   stroke-miterlimit: 4;
   fill: black;
   fill-opacity: 1;
  }
 </style>
  <rect
     style="opacity:1;fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.01;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
     id="background"
     width="3"
     height="3"
     x="0"
     y="0" />
 <g>
EOF

  for j in {0..8} ; do 
    if [ "X${combinaison:$j:1}" == "X1" ] ; then
      x=$(expr $j % 3)
      y=$(expr $j / 3)
      echo "  <rect x=\"$x\" y=\"$y\" width=\"1\" height=\"1\" id=\"r_$j\" class=\"dot\" />" >> $out
    fi
  done

  cat >> $out << EOF
 </g>
</svg>  
EOF

done
