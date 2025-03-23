shader_type canvas_item;

void fragment() {
	float time = TIME - floor(TIME);
	vec2 dir = UV - vec2(0.5, 0.5);
//	COLOR = texture(TEXTURE, UV - dir * pow(time, 0.2) * pow(length(dir), 1));
//	COLOR.a = 0.5 - length(dir);
	COLOR = vec4(1, 1, 1, pow(0.5 - length(dir), 1.2));
}
