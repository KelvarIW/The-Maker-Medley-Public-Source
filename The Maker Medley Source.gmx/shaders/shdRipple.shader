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
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float rippleSine;
uniform float rippleAmp; //remember: v_vTexcoord goes from 0 to 1
uniform float rippleFreq;
uniform vec2 uv;

const float PI = 3.14159;
float rippleX;

void main()
{
    float pos = (v_vTexcoord.y - uv.x) / (uv.y - uv.x);
    rippleX = rippleAmp*sin(mod(rippleSine + (rippleFreq*pos*(2.0*PI)), (2.0*PI)));
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + vec2(rippleX, 0.0));
}

