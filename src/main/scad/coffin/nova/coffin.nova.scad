include <puzzlecad.scad>

require_puzzlecad_version("2.0");

$burr_scale = 32;
$burr_inset = 0.11;
$burr_bevel = 0.6;

$diag_joint_scale = 0.3;
$diag_joint_position = 0.3;

*solid();
*twocolor_color1();
*twocolor_color2();
*fivecolor_bases();
*fivecolor_orbit1();
*fivecolor_orbit2();
*fivecolor_orbit3();
*fivecolor_orbit4();
*diagonal_strut();

module solid() {
    
    burr_plate([
        [".x{components={z+x-,y+z+,z+y+,z+x+}}.|.x{components={z+,y-z+,y+z+}}.|.x{components={z+x-,y-z+,z+y-,z+x+}}.",
         "x{components=x+z-}x{components={x-z-,z-x-,z-y+,z-x+,x+z-}}x{components=x-z-}|.x{components=z-}.|x{components=x+z-}x{components={x-z-,z-x-,z-y-,z-x+,x+z-}}x{components=x-z-}"]
    ], $post_rotate = [0, 45, 0], $post_translate = [-(sqrt(2)+1)/2, 0, (sqrt(2)-1)/2]);
    
}

module twocolor_color1() {
    
    burr_piece([
        ".x{components={y+z+,z+y+,z+x-}}.|.x{components={z+,y-z+,y+z+}}.|.x{components={y-z+,z+y-,z+x+}}.",
        "x{components=x+z-}x{components={z-y+,z-x-,x-z-}}|.x{components=z-}x{components={},connect=dfx-y-~}|.x{components={z-y-,x+z-,z-x+},connect=dfx+y+~}x{components=x-z-}"
    ], $post_rotate = [0, 45, 0], $post_translate = [-(sqrt(2)+1)/2, 0, (sqrt(2)-1)/2]);
    
}

module twocolor_color2() {
    
    burr_piece([
        "x{components=z+y+,connect=dfz+y+}", "x{components=z-y+}"
    ], $post_rotate = [-45, 0, 0], $post_translate = [1, 0, -1/2]);

}

module fivecolor_bases() {
    
    // Color scheme as specified in AP-ART, entry 8-B.
    
    burr_plate([
        base("AFCH"),
        base("AGDF"),
        base("AHBG"),
        base("DGBE"),
        base("BHCE"),
        base("CFDE")
    ], $post_rotate = [0, 45, 0], $post_translate = [0, 0, sqrt(1/8)]);
    
}

module fivecolor_orbit1() {
    
    fivecolor_tips("AE");
    
}

module fivecolor_orbit2() {
    
    fivecolor_tips("BF");
    
}

module fivecolor_orbit3() {
    
    fivecolor_tips("CG");
    
}

module fivecolor_orbit4() {
    
    fivecolor_tips("DH");
    
}

module fivecolor_tips(labels) {
    
    burr_plate(repeat(3, tip1(labels[0])),
        $post_rotate = [-135, 0, 0],
        $post_translate = [-1/2, 0, sqrt(2)/2 - 1/2],
        $plate_width = $burr_scale * 3
    );

    translate([$burr_scale * 2, 0, 0])
    burr_plate(repeat(3, tip2(labels[1])),
        $post_rotate = [-90, -45, 0],
        $post_translate = [-1/2, 0, -1/2],
        $plate_width = $burr_scale * 3
    );
    
}

function base(labels) = [
    ".x{components={y+z+,z+y+}}.|.x{components={z+,y-z+,y+z+}}.|.x{components={y-z+,z+y-}}.",
    str_interpolate(
        ".x{components={z-y+}}|.x{components=z-,connect=dfx+y-~,clabel=$2}x{components={},connect=dfx-y-~,clabel=$1}|.x{components=z-y-,connect=dfx+y+~,clabel=$3}x{components={},connect=dfx-y+~,clabel=$0}",
        labels
    )
];

function tip1(label) = [
    "x{components=z+x+}.",
    str_interpolate("x{components={z-x+,x+z-}}x{components=x-z-,connect=dmy+x-~,clabel=$0}", label)
];

function tip2(label) = [
    "x{components=z+x+}.",
    str_interpolate("x{components={z-x+,x+z-}}x{components=x-z-,connect=dmy+z+~,clabel=$0}", label)
];