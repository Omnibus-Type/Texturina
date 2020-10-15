#!/bin/sh
set -e
#source ../env/bin/activate

fontName="Texturina"
fontName_it="Texturina-Italic"
axes="opsz,wght"

##########################################

echo ".
GENERATING VARIABLE
."
VF_DIR=../fonts/variable
rm -rf $VF_DIR
mkdir -p $VF_DIR

fontmake -g $fontName.glyphs --family-name $fontName -o variable --output-path $VF_DIR/$fontName[$axes].ttf
fontmake -g $fontName_it.glyphs --family-name $fontName -o variable --output-path $VF_DIR/$fontName_it[$axes].ttf

##########################################

echo ".
POST-PROCESSING VF
."
vfs=$(ls $VF_DIR/*.ttf)
for font in $vfs
do
	gftools fix-dsig --autofix $font
	gftools fix-nonhinting $font $font.fix
	mv $font.fix $font
	gftools fix-unwanted-tables --tables MVAR $font
done
rm $VF_DIR/*gasp*

python gen_stat.py


##########################################

rm -rf instance_ufo/ master_ufo/

echo ".
COMPLETE!
."
