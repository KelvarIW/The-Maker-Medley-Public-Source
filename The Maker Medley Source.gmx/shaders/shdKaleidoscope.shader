//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec2 fragCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vTexcoord = in_TextureCoord;
    fragCoord = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~const float pi = 3.14159265359;
varying vec2 v_vTexcoord;
varying vec2 fragCoord;
uniform float iTime;
uniform vec2 iResolution;
vec2 kaleido(vec2 uv)
{
    float th = atan(uv.y, uv.x);
    float r_ = length(uv);
    float p1 = sin(pi * iTime / 5.0);
    float q_ = pi / ( 2.5 + 2.0 * p1);
    th = abs(mod(th, q_) - 0.5 * q_);
    return vec2(cos(th), sin(th)) * pow(r_, 1.3 + 1.3 / (1.3 + sin(0.667 * pi * iTime))) * 0.1;
}

vec2 transform(vec2 at)
{
    vec2 v;
    float th = 0.1 * iTime;
    v.x = at.x * cos(th) - at.y * sin(th) - 0.3 * sin(th);
    v.y = at.x * sin(th) + at.y * cos(th) + 0.3 * cos(th);
    return v;
}

vec4 scene(vec2 at)
{
    return texture2D(gm_BaseTexture, transform(mod(at + 0.1, 1.0)) * 2.0);
}

void main( void)
{
    vec2 uv = v_vTexcoord.xy;
    uv.x = mix(-1.0, 1.0, uv.x);
    uv.y = mix(-1.0, 1.0, uv.y);
    uv.y *= iResolution.y/iResolution.x;
    gl_FragColor = scene(kaleido(uv));
}
