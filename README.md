# DOF

DOF is a type(inter)face initiated on the occasion of the exhibition and research project [The Weathers They Live In](http://twtli.nicolaarthen.com). Written in the typographic description language _METAFONT_, it can be understood as a set of genes to generate different families by the regulation of parameters. 

At present DOF supports the ASCII character set (with some additional characters) and its major parameters are `unite-width`, `stroke-width` and `-height`, `slant`, `overdraw`, `superness` and `cutoff (/ expand)`. Throughout the development the three families [DOF-1](https://github.com/paulbernhard/dof/tree/master/Outline/DOF-1), [DOF-2](https://github.com/paulbernhard/dof/tree/master/Outline/DOF-2) and [DOF-3](https://github.com/paulbernhard/dof/tree/master/Outline/DOF-3) have been released and converted to outline fonts.

DOF is licenesed under the _SIL Open Font License_, its source code and outline fonts are free to use. Further parameters and characters will be developed in the future. For requests contact me mail (at) pbernhard.com.

![DOF Specimen](specimen/DOF_specimen.png?raw=true "DOF Specimen")

# Docs

DOF would not be possible without the programmatic dedication to typography of Donald E. Knuth, the creator of METAFONT, and his comprehensive work on the typeface [Computer Modern](http://ctan.com). For a deeper understanding of METAFONT read _The Concept of a Meta-Font_ and the _METAFONTbook_ by Donald E. Knuth.

To generate DOF families with the following steps METAFONT, GFtoDVI and XDVI are required. All of these will come with a basic installation of _TeX_ or _LaTeX_.

## Parameters

Visualisations of major parameters can be found at [examples/parameters/](https://github.com/paulbernhard/dof/tree/master/examples/parameters/). Parameter settings of existing families can be found in the respective [outline/](https://github.com/paulbernhard/dof/tree/master/Outline/) folder (e.g. [dof-1-parameters.txt](https://github.com/paulbernhard/dof/tree/master/Outline/DOF-1/dof-1-parameters.txt)). 

`slant = 0` positive or negative font slant (_numeric value_, _0_ = no slant)
`u = 3/9pt` unit width defines the basic character width
`cap = 9pt` capital height
`xheight = 0.75cap` x-height
`figheight = cap` figure height
`desc = 2.25pt` descender depth
`s = 2u` character's distance to its sidebearings
`o = 1/18pt` vertical overshoot of round characters, as in O or U
`barheight = 0.5cap` height of horizontal bar, as in H
`ebarheight = 0.5xheight` height of horizontal bar in lowercase, as in e
`overdraw = 0.5u` overdraw the stroke endings of certain characters, as in E, I or R
`opendraw = true` leave circles of certain characters open, as in %-, °-symbol and 0 (boolean _true_ or _false_)
`superness = 0.74` controls the corner expansion of round shapes (super-ellipse), as in O, S or g (_numeric value_ between _0_ and _1_, higher values expand and lower values implode the character's corners, _0.74_ equals a regular round ellipse)
`cutoff = false` cut off the stroke endings (boolean _true_ or _false_)
`expand = 1/10pt` _if cutoff = true_, controls the stroke expansion towards cut off stroke endings
`compactcor = 0.7` _if cutoff = true_, thin out strokes to correct compaction, as in A or M (_numeric value_ between _0_ and _1_)
`penx = 1.1pt` stroke-width
`peny = 0.4pt` stroke-height
`penangle = 0` pen angle (degrees as _numeric value_)
`puncscale = 1.2` scale of pen for dots in punctuation

## Structure and Rendering

All necessary source files are in the [source/](https://github.com/paulbernhard/dof/tree/master/source/) folder. `dofbase.mf` is DOF's base file with the font setup and necessary helper methods. The character coordinates are defined in `dofupper.mf` (uppercase characters), `doflower.mf` (lowercase characters) and `doffigurepunc.mf` (figures and punctuation). The parameters are defined in an initiative file (e.g. `dof1reg.mf` for DOF-1 Regular) which will call the base file and so on. 

To generate new DOF families and view a proof, copy one of the parameter files, such as `dof1reg.mf`, to `newdof.mf`, adjust the parameters and render with…

    $ mf newdof

…this will create a proof file `newdof.2602gf` (Generic font file format). Convert this file to .dvi (Device independent file format) with…

    $ gftodvi newdof2602.gf

…and display the created `newdof.dvi`.

    $ xdvi newdof

To conclude everything in on command:

    $ mf newdof && gftodvi newdof.2602gf && xdvi newdof

## Outline conversion

METAFONT was originally meant to provide bitmap fonts for TeX, thus it is not able to output scalable outline fonts (e.g. TrueType) on its own. For this purpose Han-Wen Nienhuys wrote the program _mftrace_ which accepts METAFONT's files, traces the output and convert them to PostScript or TrueType. A list of available options can be found on the [mftrace website](http://lilypond.org/mftrace/).

    $ mftrace newdof.mf

The resulting output `newdof.pfa` (PostScript) might have some misplaced glyphs, missing font information or encoding which can be done with any font editor, such as _[FontForge](https://fontforge.github.io/en-US/)_. DOF has a _FontForge_ script [outline/convert.pe](https://github.com/paulbernhard/dof/tree/master/source/) to fix its misplaced glyphs, add font information and output a ISO8859-1 TrueType file. Move the PostScript file `newdof.pfa` in the same folder as the `convert.pe` script and run with the following arguments…

    $ fontforge -script convert.pe newdof.pfa familyname fontweight versionnumber

…to output `newdof.ttf`. 

## References

- _[The Concept of a Meta-Font](http://www.zigzaganimal.be/elements/the-concept-of-metafont.pdf)_ by Donald E. Knuth, 1982
- _[METAFONTbook](https://www.google.de/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjUl_f8uMfVAhWEwxQKHTgTDgEQFggpMAA&url=http%3A%2F%2Fwww.ctex.org%2Fdocuments%2Fshredder%2Fsrc%2Fmfbook.pdf&usg=AFQjCNEPW5Q4-2y0QAKtEE9eDMM4yVTrqw)_ by Donald E. Knuth, Reading, Massachusetts: Addison-Wesley, 1986 (PDF version without figures)
- _[mftrace - Scalable PostScript Fonts  for MetaFont](http://lilypond.org/mftrace/)_ by Han-Wen Nienhuys
