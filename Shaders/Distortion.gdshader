shader_type canvas_item;

uniform sampler2D dist_noise : repeat_enable;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_linear_mipmap;


void fragment() {
//	vec2 uv1 = vec2(UV.x + TIME * 0.2, UV.y + TIME * 0.1);
//	vec2 uv2 = vec2(UV.x - TIME * 0.12 + 0.5, UV.y + TIME * 0.08);
//	vec2 uv3 = vec2(UV.x - TIME * 0.1 + 0.3, UV.y + TIME * 0.3);
	float time = TIME * 0.07;
//	vec2 uv1 = vec2(UV.x, UV.y);
//	vec2 uv2 = vec2(UV.x - time * 0.07 + 0.5, UV.y + time * 0.09 + 0.3);
//	vec2 uv3 = vec2(UV.x - time * 0.1 + 0.3, UV.y + time * 0.3);
	float power = 0.01;
	vec2 uv1 = SCREEN_UV + texture(dist_noise, UV + time * 0.83 + 0.3).r * power;
	vec2 uv2 = SCREEN_UV + texture(dist_noise, UV - time).r * power;
	vec4 col = texture(screen_texture, (uv1 + uv2) / 2.0);
	col.rg *= 0.5;
	
	COLOR = col;
}
