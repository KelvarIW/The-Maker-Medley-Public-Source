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

uniform float pixelW;
uniform float pixelH;
uniform vec3 outlineCol;

const int prec = 48;
const float Pi = 3.14159;

float Ncos = 0.;
float Nsin = 0.;

void main()
{
    float outW = pixelW;
    float outH = pixelH;
    float inputAlpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
    if (inputAlpha == 0.){
        float highestAlpha = 0.;
        float Tcos = 1.;   // Start from theta = zero.
        float Tsin = 0.;
        float inc = 1./float(prec);
        
        float beta  = sin(2. * Pi * inc);
        float alpha = sin(Pi * inc);
        alpha = 2. * alpha * alpha;
        
        for(int i = 0; i < prec; i++){
            Ncos = (alpha * Tcos) + (beta * Tsin);
            Nsin = (alpha * Tsin) - (beta * Tcos);
        
            Tcos -= Ncos;
            Tsin -= Nsin;
            highestAlpha = texture2D(gm_BaseTexture, v_vTexcoord + vec2(outW*Tcos, outH*(-Tsin))).a;
            if (highestAlpha != 0.0){
                break;
            }
        }
        gl_FragColor = v_vColour * vec4(outlineCol.rgb, highestAlpha);
    }else{
        gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
    }
}
