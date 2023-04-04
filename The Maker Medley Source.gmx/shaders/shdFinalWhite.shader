//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 size;//width,height,radius,multiplier
const float Quality = 12.;
const float Directions = 24.;
const float TwoPi = 6.28319;//pi * 2
const float angInc = TwoPi/Directions;
const float distCheckInc = 1.0/Quality;

void main()
{
    vec2 radius = size.z/size.xy;
    vec4 Color = vec4(1.0, 1.0, 1.0, texture2D( gm_BaseTexture, v_vTexcoord).a);
    if (Color.a == 0.0){
        for( float d=0.0; d<TwoPi; d+=angInc)
        {
            for( float i=distCheckInc; i<=1.0; i+=distCheckInc)
            {
                Color.a += texture2D( gm_BaseTexture, v_vTexcoord+vec2(cos(d),sin(d))*radius*i).a;
            }
        }
        Color.a /= (1. + Quality*Directions);
        Color.a *= size.a;
    }else{
        Color.a = 0.0;
    }
    gl_FragColor = Color;
}
