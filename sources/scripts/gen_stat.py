from fontTools.otlLib.builder import buildStatTable, _addName
from fontTools.ttLib import TTFont
import sys


AXES = [
    dict(
        tag="opsz",
        name="Optical size",
        ordering=0,
        values=[
            dict(value=12, name="12pt", flags=0x2),
            dict(value=72, name="72pt"),
        ],
    ),
    dict(
        tag="wght",
        name="Weight",
        ordering=1,
        values=[
            dict(nominalValue=100, rangeMinValue=100, rangeMaxValue=150,name="Thin"),
            dict(nominalValue=200, rangeMinValue=150, rangeMaxValue=250,name="ExtraLight"),
            dict(nominalValue=300, rangeMinValue=250, rangeMaxValue=350,name="Light"),
            dict(nominalValue=400, rangeMinValue=350, rangeMaxValue=450,name="Regular", flags=0x2, linkedValue=700),
            dict(nominalValue=500, rangeMinValue=450, rangeMaxValue=550,name="Medium"),
            dict(nominalValue=600, rangeMinValue=550, rangeMaxValue=650,name="SemiBold"),
            dict(nominalValue=700, rangeMinValue=650, rangeMaxValue=750,name="Bold"),
            dict(nominalValue=800, rangeMinValue=750, rangeMaxValue=850,name="ExtraBold"),
            dict(nominalValue=900, rangeMinValue=850, rangeMaxValue=900,name="Black"),
        ],
    ),
    dict(
        tag="ital",
        name="Italic",
        ordering=2,
        values=[
            dict(value=0, name="Roman", flags=0x2, linkedValue=1),
        ],
    ),
]

def update_fvar(ttfont):
    fvar = ttfont['fvar']
    nametable = ttfont['name']
    family_name = nametable.getName(16, 3, 1, 1033) or nametable.getName(1, 3, 1, 1033)
    family_name = family_name.toUnicode().replace(" ", "")
    nametable.setName(family_name, 25, 3, 1, 1033)
    for instance in fvar.instances:
        instance_style = nametable.getName(instance.subfamilyNameID, 3, 1, 1033).toUnicode()
        ps_name = f"{family_name}-{instance_style.replace(' ', '')}"
        instance.postscriptNameID = _addName(nametable, ps_name, 256)


def main():
    filepath = sys.argv[1]
    tt = TTFont(filepath)
    buildStatTable(tt, AXES)
    update_fvar(tt)
    tt.save(filepath)
    print(f"Added STAT table to {filepath}")


if __name__ == "__main__":
    main()
