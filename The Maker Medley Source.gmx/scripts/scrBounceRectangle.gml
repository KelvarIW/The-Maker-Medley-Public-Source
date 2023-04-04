///scrBounceRectangle(x1, y1, x2, y2)
    //
    //  Makes the calling instance reverse direction if it is colliding with
    //  the boundary of a given rectangle. Meant to keep an instance inside an
    //  area. Swap the corners to bounce against the outside of a rectangle.
    //
    //      x1,y1       upper left corner of bounding rectangle, real
    //      x2,y2       lower right corner of bounding rectangle, real
    //
    /// GMLscripts.com/license
    if (bbox_right - abs(hspeed) <= argument0 || bbox_left + abs(hspeed) >= argument2) {
        if (x - abs(hspeed) <= argument0) hspeed = -1*abs(hspeed);
        else if (x + abs(hspeed) >= argument2) hspeed = abs(hspeed)
    }
    if (bbox_bottom - abs(vspeed) <= argument1 || bbox_top  + abs(vspeed) >= argument3) {
        if (y - abs(vspeed) <= argument1) vspeed = -1*abs(vspeed);
        else if (y + abs(vspeed) >= argument3) vspeed = abs(vspeed)
    }
    return -1;
