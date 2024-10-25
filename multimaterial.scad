/* SOURCE: https://erik.nygren.org/2018-3dprint-multicolor-openscad.html */


/* HOW TO USE: 
1 - Make sure to "include" package as "use" will not function.
2 - Set the current_color variable after including the package
*/


/* Pick a color below for STL export, or "ALL" to show all colors. */
current_color = "ALL";
//current_color = "blue";
//current_color = "white";
//current_color = "red";

/* Similar to the color function, but can be used for generating multi-color models for printing.
 * The global current_color variable indicates the color to print.
 */
module multicolor(color) {
    if (current_color != "ALL" && current_color != color) { 
        // ignore our children.
        // (I originally used "scale([0,0,0])" which also works but isn't needed.) 
    } else {
        color(color)
        children();
    }        
}
