#!/bin/sh
set -e
#source ../env/bin/activate

fontName="Texturina"
fontName_it="Texturina-Italic"

##########################################

TT_DIR=../fonts/ttf
OT_DIR=../fonts/otf
WEB_DIR=../fonts/webfonts

rm -rf $TT_DIR $OT_DIR $WEB_DIR
mkdir -p $TT_DIR $OT_DIR $WEB_DIR

##########################################

echo ".
GENERATING STATICS
."
fontmake -g $fontName.glyphs -i -o ttf --output-dir $TT_DIR
fontmake -g $fontName_it.glyphs -i -o ttf --output-dir $TT_DIR

fontmake -g $fontName.glyphs -i -o otf --output-dir $OT_DIR
fontmake -g $fontName_it.glyphs -i -o otf --output-dir $OT_DIR

##########################################

echo ".
POST-PROCESSING TTF
."
ttfs=$(ls $TT_DIR/*.ttf)
for font in $ttfs
do
	gftools fix-dsig --autofix $font
	python -m ttfautohint $font $font.fix
	[ -f $font.fix ] && mv $font.fix $font
	gftools fix-hinting $font
	[ -f $font.fix ] && mv $font.fix $font
	fonttools ttLib.woff2 compress $font
done

echo ".
MOVE WEBFONTS TO OWN DIRECTORY
."
webfonts=$(ls $TT_DIR/*.woff*)
for font in $webfonts
do
  mv $font $WEB_DIR
done

echo ".
POST-PROCESSING OTF
."
otfs=$(ls $OT_DIR/*.otf)
for font in $otfs
do
	gftools fix-dsig --autofix $font
	gftools fix-weightclass $fonts
	[ -f $font.fix ] && mv $font.fix $font
done





rm -rf instance_ufo/ master_ufo/

echo ".
COMPLETE!
."
