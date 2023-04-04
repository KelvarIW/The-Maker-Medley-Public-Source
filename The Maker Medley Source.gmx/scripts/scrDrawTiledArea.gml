/// scrDrawTiledArea(background,xOrigin,yOrigin,x1,y1,x2,y2)
//
//  Draws a repeated background image, tiled to fill a given region and with
//  a given offset. 
//
//      background  background to be drawn
//      x,y         origin offset, real
//      x1,y1       top-left corner of tiled area, real
//      x2,y2       bottom-right corner of tiled area, real
//
// Credit to EyeGuy from GMLScripts.com

var bg,xx,yy,x1,y1,x2,y2;
bg = argument[0];
xx = argument[1];
yy = argument[2];
x1 = argument[3];
y1 = argument[4];
x2 = argument[5];
y2 = argument[6];

var bw,bh,i,j,jj,left,top,width,height,X,Y;
bw = background_get_width(bg);
bh = background_get_height(bg);

i = x1-(xx mod bw) - bw*((xx mod bw) < 0);
j = y1-(yy mod bh) - bh*((yy mod bh) < 0); 
jj = j;

for(i=i; i<=x2; i+=bw) {
    for(j=j; j<=y2; j+=bh) {
        
        if(i <= x1) left = x1-i;
        else left = 0;
        X = i+left;

        if(j <= y1) top = y1-j;
        else top = 0;
        Y = j+top;

        if(x2 <= i+bw) width = ((bw)-(i+bw-x2)+1)-left;
        else width = bw-left;

        if(y2 <= j+bh) height = ((bh)-(j+bh-y2)+1)-top;
        else height = bh-top;

        draw_background_part(bg,left,top,width,height,X,Y);
    }
    j = jj;
}
