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
varying vec2 coordinate;
uniform float pixelW;
uniform float pixelH;
float transx[4];
float transy[4];
float alphaCheck[4];

void main()
{
    float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
    
    if (alpha != 0.0){
        //Transformations; angle = 90*position
        transx[3] = 0.0;
        transx[2] = -1.0 * pixelW;
        transx[1] = 0.0;
        transx[0] = pixelW;
        transy[3] = pixelH;
        transy[2] = 0.0;
        transy[1] = -1.0*pixelH;
        transy[0] = 0.0;
        
        //angle = 90*position
        alphaCheck[0] = texture2D(gm_BaseTexture, v_vTexcoord + vec2(transx[0], transy[0])).a;
        alphaCheck[1] = texture2D(gm_BaseTexture, v_vTexcoord + vec2(transx[1], transy[1])).a;
        alphaCheck[2] = texture2D(gm_BaseTexture, v_vTexcoord + vec2(transx[2], transy[2])).a;
        alphaCheck[3] = texture2D(gm_BaseTexture, v_vTexcoord + vec2(transx[3], transy[3])).a;
        float lowestAlpha = min(min(alphaCheck[0], alphaCheck[1]), min(alphaCheck[2], alphaCheck[3]));
        
        //Fix missing corners; angle = 90*position + 45
        if (lowestAlpha != 0.0){
            for(float j = 5.0; j > 0.0; j -= 1.0){
                if (lowestAlpha != 0.0){
                    alphaCheck[0] = texture2D(gm_BaseTexture, v_vTexcoord + vec2(pixelW*j/5.0, -1.0*pixelH*j/5.0)).a;
                    alphaCheck[1] = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-1.0*pixelW*j/5.0, -1.0*pixelH*j/5.0)).a;
                    alphaCheck[2] = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-1.0*pixelW*j/5.0, pixelH*j/5.0)).a;
                    alphaCheck[3] = texture2D(gm_BaseTexture, v_vTexcoord + vec2(pixelW*j/5.0, pixelH*j/5.0)).a;
                }
                lowestAlpha = min(min(alphaCheck[0], alphaCheck[1]), min(alphaCheck[2], alphaCheck[3]));
            }
        }
        
        lowestAlpha = min(min(alphaCheck[0], alphaCheck[1]), min(alphaCheck[2], alphaCheck[3]));
        if (lowestAlpha != 0.0){
            discard;
        }
        gl_FragColor = vec4(v_vColour.rgb, v_vColour.a * alpha);
    }
}
