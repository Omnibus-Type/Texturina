# Texturina family

**Torres & Omnibus-Type Team**
*SIL Open Font License 1.1,*
*36 fonts (18 display, 18 text), +800 glyphs each variant.*

Texturina, A highly applicable typeface with the richness of Blackletter, yet maintaining fluidity by combining broken and softened curves. Latin GF Plus character set (+630 characters/+800 glyphs). TTFAutohint. Designed by Guillermo Torres (CO).

![Sample of Texturina Family.](documentation/Texturina-01.png "Texturina")
![Sample of Texturina Family.](documentation/Texturina-02.png "Texturina")

#### To build the font:

There are 2 options to build the font. Either you let the github action doing it, either you do it with gftools builder.

A. If you modify the sources (glyphs files in sources directory), it will trigger an "action" which will build the fonts and run Fontbakery (QA tool). If Fontbakery shows no fail (ie. passed and is green), then you can download a package containing the fonts. You will find the last action in the [Actions tab](https://github.com/Omnibus-Type/Texturina/actions), please click on the title of this action (which should be the title of the last commit), and you will find a zip file in the "artifact" section.

B. Otherwise you can build the font locally, after cloning this repo.
    
    1. At the root of your local clone (cd path/to/local/clone), create a virtual environment: python3 -m venv env
    
    2. Activate the virtual env: source env/bin/activate
    
    3. Install gftools (or the requirements) in the virtual env: pip install gftools
    
    4. go to the "sources" directory and from the terminal, run : gftools builder config.yaml
    
    5. There! you will find the fonts in the fonts directory.

Don't forget to alway activate your virtual environment before running gftools builder.


#### Texturina Family contains:
* On display set
* Thin / Thin Italic
* ExtraLight / ExtraLight Italic
* Light / Light Italic
* Regular / Italic
* Medium / Medium Italic
* SemiBold / SemiBold Italic
* Bold / Bold Italic
* ExtraBold / ExtraBold Italic
* Black / Black Italic

* On text set
* Thin Text / Thin Italic Text
* ExtraLight Text / ExtraLight Italic Text
* Light Text / Light Italic Text
* Regular Text / Italic Text
* Medium Text / Medium Italic Text
* SemiBold Text / SemiBold Italic Text
* Bold Text / Bold Italic Text
* ExtraBold Text / ExtraBold Italic Text
* Black Text / Black Italic Text

To contribute to the project contact [Omnibus-Type](http://omnibus-type.com/).

### Designers

* Guillermo Torres Carreño

### License

Copyright (c) 2020, Omnibus-Type (www.omnibus-type.com | omnibus.type@gmail.com)

Licensed under the [*SIL Open Font License, 1.1*](http://scripts.sil.org/OFL); you may not use this file except in compliance with the License.

======
## FONTLOG for the Texturina fonts

This file provides detailed information on the Texturina font software.  
This information should be distributed along with the Texturina fonts and any derivative works.

### Texturina is a typeface family that supports the following Unicode language range: 

* Basic Latin 					U+0020-U+007E
* Latin-1 Supplement 				U+00A0-U+00FF
* Latin Extended-A 				U+0100-U+017F
* Latin Extended Additional*			U+1E00-U+1EFF *(111/256)

**Character map to support MS Codepages:**
* 1252 Latin-1
* 1250 Latin-2 (Easter Europe)
* 1254 Turkish
* 1257 Windows Baltic
* 1258 Vietnamese
* Mac Roman

*To contribute to the project contact Omnibus-Type at omnibus.type@gmail.com*

**2019 December 16 (v1.000) Initial Commit (Omnibus-Type)**
- Initial commit

### Acknowledgements

If you make modifications be sure to add your name (N), email (E), web-address
(if you have one) (W) and description (D). This list is in alphabetical order.

**N:** **Yorlmar Campos**  
**E:** omnibus.type@gmail.com  
**W:** http://www.omnibus-type.com  
**D:** Typeface development

**N:** **Guillermo Torres Carreño**  
**E:** omnibus.type@gmail.com  
**W:** http://www.omnibus-type.com  
**D:** Designer 

**N:** **Martín Sesto**  
**E:** omnibus.type@gmail.com  
**W:** http://www.omnibus-type.com  
**D:** Typeface development
