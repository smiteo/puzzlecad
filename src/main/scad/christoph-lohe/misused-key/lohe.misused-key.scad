/* ====================================================================

  This is a 3D model of a mechanical puzzle. It is released under
  the following license:

  Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported
  https://creativecommons.org/licenses/by-nc-nd/3.0/

  This means the model is licensed for personal, noncommercial use
  only. Anyone may print a copy for their own use, but selling or
  otherwise monetizing the model or print (or any derivatives) is
  prohibited. For details, refer to the summary at the above URL.

  Puzzle design (c) Christoph Lohe
  3D model (c) Aaron Siegel

==================================================================== */

include <puzzlecad.scad>

// This model was generated by puzzlecad's bt2scad tool from the BurrTools file:
// Misused Key 26.8.xmpuzzle

// You can freely edit this file to make changes to the model structure or parameters.

require_puzzlecad_version("2.0");

$burr_scale = 10;

*frame();
*shackle();
*pieces();
*key();

module frame() {

    burr_plate([
        [ "xxxxxxx|xxxxxxx|xxxxxxx|xxxxxxx",
          "x.....x|x.x...x|x.....x|x.....x",
          "x.....x|x.....x|x.....x{connect=fx-z+,clabel=B}|x.....x",
          "x.....x|x.....x|x.....x|x.....x",
          "x.....x|x.....x|x.....x|x.....x",
          "x{connect=mz+y+,clabel=A}.....x{connect=mz+y+,clabel=A}|x{connect=fx+z+,clabel=B}.....x|x.....x|x{connect=mz+y+,clabel=A}.....x{connect=mz+y+,clabel=A}" ],
        [ "x{connect=fz-y+,clabel=A}xxxxxx{connect=fz-y+,clabel=A}|x.....x|x.....x|x{connect=fz-y+,clabel=A}xxxxxx{connect=fz-y+,clabel=A}" ],
        [ "x{connect=mz+y+,clabel=B}" ],
        [ "x{connect=mz+y+,clabel=B}" ]
    ]);

}

module shackle() {
    
     burr_plate([
        ["x....|x....|x....|x....|xx.x{connect=mz+y+,clabel=C}.|xx.xx|x...x|x...x|x...x|xxxxx",
         "x....|.....|.....|.....|.x...|xx.xx|x...x|x...x|x...x|xxxxx"],
        ["x|x|x|x|x{connect=fz+y+,clabel=C}", "x|.|.|.|."]
    ]);
    
}

module pieces() {
    
    burr_plate([
        [ "x..x|xxxx|x..x", "x..x|x..x|x..x" ],
        [ "x..x|xxxx|xx.x", "x..x|x..x|x..x" ],
        [ "xx.x|x..x|xxxx", "x..x|x..x|x..x" ],
        [ "x.xx|x..x|xxxx", "x..x|x..x|x..x" ]
    ]);
    
}

module key() {
    
    burr_piece(".x.|.xx|.x.|.x.|xxx|x.x|xxx");
    
}