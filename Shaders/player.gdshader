shader_type canvas_item;

void fragment() {
	float alpha = texture(TEXTURE, UV).a;
	COLOR = mix(texture(TEXTURE, UV), vec4(vec3(UV.x + sin(TIME), UV.y - cos(TIME), 0.8), alpha), pow(max(UV.x, 1.0 - UV.x), 4) + pow(1.0 - alpha, 0.2));
}
