#! /bin/bash

echo "forefround=$(xtermcontrol --get-fg)" 
echo "background=$(xtermcontrol --get-bg)" 

for i in {0..15};do echo "color${i}=$(xtermcontrol --get-color${i})" ; done
