#!/bin/bash
# $1=File, $2=Fontfamily, $3=Fontweight
mftrace $1 --encoding=dvips.enc --define=FontName="$2-$3" --define=FamilyName=$2 --define=FullName="$2-$3" --define=Weight=$3
