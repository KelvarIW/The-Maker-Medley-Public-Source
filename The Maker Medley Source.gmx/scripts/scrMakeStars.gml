///scrMakeStars(x,y,angle,edges,numprojectiles,speed,obj)
///spawns a custom shape
///argument0 - spawn X
///argument1 - spawn Y
///argument2 - starting angle
///argument3 - number of points
///argument4 - projectile spawns per point
///argument5 - speed
///argument6 - projectile to spawn

var spawnX = argument0;
var spawnY = argument1;
var spawnAngle = argument2;
var spawnEdges = argument3*2;
var spawnNum = argument4;
var spawnSpeed = argument5;
var spawnObj = argument6;
var th, xx, yy, ddx, ddy, dx, dy, a;

th = degtorad(spawnAngle);

for (var i = 0; i < spawnEdges; i += 1)
{
    xx[i] = cos(th + 2*pi * i/spawnEdges) * ((i % 2) + 1) ;
    yy[i] = sin(th + 2*pi * i/spawnEdges) * ((i % 2) + 1) ;
}

xx[spawnEdges] = xx[0];
yy[spawnEdges] = yy[0];

for (var i = 0; i < spawnEdges; i += 1)
{
    ddx = xx[i+1]-xx[i];
    ddy = yy[i+1]-yy[i];
    
    for(var j = 0; j < spawnNum; j += 1)
    {
        dx = xx[i]+ddx*j/spawnNum;
        dy = yy[i]+ddy*j/spawnNum;
        
        a = instance_create(spawnX+dx,spawnY+dy,spawnObj);
        a.direction = point_direction(0,0,dx,dy);
        a.speed = spawnSpeed*point_distance(0,0,dx,dy);
        a.ident = j
    }
}
