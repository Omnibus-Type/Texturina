#!/bin/sh
set -e
source ../env/bin/activate

TT_DIR=../fonts/ttf
OT_DIR=../fonts/otf
WEB_DIR=../fonts/webfonts

echo ".
MAKE UFO
."
rm -rf *.ufo
glyphs2ufo Texturina.glyphs --generate-GDEF
glyphs2ufo Texturina-Italic.glyphs --generate-GDEF
rm Texturina.designspace Texturina-Italic.designspace

##########################################

echo ".
GENERATING STATICS
."
rm -rf $TT_DIR $OT_DIR $WEB_DIR
mkdir -p $TT_DIR $OT_DIR $WEB_DIR

fontmake -m Texturina-statics.designspace -i -o ttf --output-dir $TT_DIR
fontmake -m Texturina-Italic-statics.designspace -i -o ttf --output-dir $TT_DIR

fontmake -m Texturina-statics.designspace -i -o otf --output-dir $OT_DIR
fontmake -m Texturina-Italic-statics.designspace -i -o otf --output-dir $OT_DIR

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

echo ".
BUILDDING WEBFONTS
."
ttfs=$(ls $TT_DIR/*.ttf)
for fonts in $ttfs
do
  woff2_compress $fonts
  sfnt2woff-zopfli $fonts
done

webfonts=$(ls $TT_DIR/*.woff*)
for font in $webfonts
do
  mv $font $WEB_DIR
done


rm -rf instance_ufo/ *.ufo

echo ".
COMPLETE!
."
