//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;

float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

void main()
{
    vec4 base = texture2D( gm_BaseTexture, v_vTexcoord );
    
    float redWeight = base.r/(base.r+base.b);
    float blueWeight = base.b/(base.r+base.b);
    float intensity = length(base.rgb);
    
    const float cutoff = 0.2;
    const float cutoff2 = 0.5;
    
    vec4 saturated = vec4(redWeight*0.5, 0.0, blueWeight*0.5, 1.0);
    
    if (intensity < cutoff) {
        float eIntensity = intensity / cutoff;
        gl_FragColor = mix(vec4(0.0), saturated, eIntensity);
    } else if (intensity < cutoff2) {
        float eIntensity = (intensity - cutoff)/(cutoff2 - cutoff);
        gl_FragColor = mix(saturated, vec4(0.0, 0.0, 0.0, 1.0), eIntensity);
    } else {
        gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
    }
}

