# chopin-opus-66
This is the LilyPond engraving source file used to create the Chopin Fantaisie-Impromptu, opus 66.

## Creating the PDF and MIDI files
(I highly recommend the [Frescobaldi](https://www.frescobaldi.org/) IDE for LilyPond.  It makes all of the following much easier.)

The PDF and MIDI files can be created by issuing the following command in the directory this file is in (assuming you have `lilypond` in your PATH variable):

        lilypond impromptu-op66.ly

To create a smaller PDF, try:

        lilypond -dno-point-and-click impromptu-op66.ly

You may also download the latest release [here](https://github.com/ksnortum/chopin-opus-66/releases/latest) to get the compiled PDF and MIDI files.

### Two-sided printing
`impromptu-op66.ly` is set up so that you can print it on two sides of the paper and leave an extra margin amount on the inside pages for binding.  If you don't want this, find the `\paper` block (near the bottom) and set `two-sided = ##f`.

## License
This work is licensed under the [Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/) from Creative Commons.  Follow the link for details.  Basically, you can use this work however you want *if* you keep the same license and you attribute the work to me, Knute Snortum (knute (at) snortum (dot) net). 

