shader_type canvas_item;

void fragment() {
	float alpha = texture(TEXTURE, UV).a;
	float len_x = abs(0.5 - UV.x);
	float len_y = abs(0.5 - UV.y);
	COLOR = mix(vec4(1, 1, 1, 0), vec4(UV.x, UV.y, 1.0, pow(alpha, 20)), max(0, 0.5 - sqrt(len_x * len_x + len_y * len_y)) * 2.4);
}
