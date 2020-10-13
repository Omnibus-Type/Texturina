#!/bin/sh
set -e
#source ../env/bin/activate

VF_PATH=../fonts/variable/Texturina[opsz,wght].ttf
VF_PATH_IT=../fonts/variable/Texturina-Italic[opsz,wght].ttf

echo ".
MAKE UFO
."
rm -rf *.ufo
glyphs2ufo Texturina.glyphs --generate-GDEF
glyphs2ufo Texturina-Italic.glyphs --generate-GDEF
rm Texturina.designspace Texturina-Italic.designspace

##########################################

echo ".
GENERATING VARIABLE
."
rm -rf ../fonts/variable
mkdir -p ../fonts/variable

fontmake -m Texturina-VF.designspace -o variable --output-path $VF_PATH
fontmake -m Texturina-VF-Italic.designspace -o variable --output-path $VF_PATH_IT

##########################################

echo ".
POST-PROCESSING VF
."
vfs=$(ls ../fonts/variable/*.ttf)
for font in $vfs
do
	gftools fix-dsig --autofix $font
	gftools fix-nonhinting $font $font.fix
	mv $font.fix $font
	gftools fix-unwanted-tables --tables MVAR $font
done
rm ../fonts/variable/*gasp*

python gen_stat.py


rm -rf instance_ufo/ *.ufo

echo ".
COMPLETE!
."
