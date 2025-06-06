shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0; // controlled by animationplayer
uniform float time_scale = 1.0;
uniform float pixel_size = 10.0;
uniform vec4 inner_color : source_color = vec4(1.0, 1.0, 0.0, 1.0);
uniform vec4 outer_color : source_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform float explosion_size = 1.0;


float rand(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}
varying vec2 PIXEL_SIZE; //https://github.com/godotengine/godot/issues/103600

vec2 pixelate(vec2 uv, float size) {
    float pixelWidth = size / PIXEL_SIZE.x;
    float pixelHeight = size / PIXEL_SIZE.y;
    vec2 pixelatedUV = floor(uv * vec2(pixelWidth, pixelHeight)) / vec2(pixelWidth, pixelHeight);
    return pixelatedUV;
}

void fragment() {
  	COLOR = vec4(0.0);
	PIXEL_SIZE = TEXTURE_PIXEL_SIZE;

    vec2 pixel_uv = pixelate(UV, pixel_size);

    vec2 center = vec2(0.5, 0.5);
    float dist = distance(pixel_uv, center);

    float radius = progress * explosion_size;

	// maybe instead be smart the distance probably have slow square root?
    if (dist < radius) {

        float noise = rand(pixel_uv * 10.0 + TIME);

        float color_blend = smoothstep(0.0, radius, dist);
        vec4 base_color = mix(inner_color, outer_color, color_blend);

        base_color.rgb += (noise - 0.5) * 0.2;

        float fade = 1.0 - smoothstep(radius * 0.8, radius, dist);
        base_color.a *= fade;

        COLOR = base_color;

	}

}