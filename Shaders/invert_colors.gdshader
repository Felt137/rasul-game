shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear_mipmap;

void fragment(){
	vec4 color = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgba;
	COLOR = vec4(1.0 - color.r, 1.0 - color.g, 1.0 - color.b, color.a);
}