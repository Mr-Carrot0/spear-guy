shader_type canvas_item;

uniform vec4 flash_color;

void fragment() {
	COLOR.rgb = flash_color.rgb; // keep the original alpha
}
