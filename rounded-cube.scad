/* SOURCE: https://www.reddit.com/r/openscad/comments/bfx897/comment/elhugtd/ */

/* NOTEs: Size of rendered object is 
[bottomWidth + roundedRadius,bottomLength + roundedRadius, height + 2*roundedRadius]]

unsure why taper is needed and why it would be applied asymmetrically. 

*/

$fa = 1; $fs = 0.5;
$fn=60; // 60 for higher resolution?

//For a cube set taper to 0
module roundedCube(bottomWidth, bottomLength, height, taper, roundedRadius) {
    translate([0,0,roundedRadius])
    hull() {
        //Bottom
        roundedRectangle([bottomWidth, bottomLength, 0], roundedRadius);

        //Top
        roundedRectangle([bottomWidth, bottomLength, height], roundedRadius, taper);
    }
}

module roundedRectangle(size, radius, frontTaper = 0) {
    x = size[0];
    y = size[1];
    z = size[2];

    hull() {
        cornerSphere([(-x/2)+(radius/2), (-y/2)+(radius/2) - frontTaper, z], radius);
        cornerSphere([(x/2)-(radius/2), (-y/2)+(radius/2) - frontTaper, z], radius);
        cornerSphere([(-x/2)+(radius/2), (y/2)-(radius/2), z], radius);
        cornerSphere([(x/2)-(radius/2), (y/2)-(radius/2), z], radius);
    }
}

module cornerSphere(location, radius) {
    translate(location) sphere(r=radius);
}

module ccube(size = [1,1,1]){
    dx = size[0]/2;
    dy = size[1]/2;
    translate([-dx,-dy,0])cube(size);
}




