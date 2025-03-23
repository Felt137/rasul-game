shader_type canvas_item;

//uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform bool enabled;

void fragment() {
	if (enabled) {
		float speedscale = 0.5;
		float time = TIME * speedscale;
		float power = 2.0;
		float r = 0.1 + pow(abs(sin(UV.x + time)), power) * 0.9;
		float g = 0.1 + pow(abs(sin(UV.x + time + PI / 3.0)), power) * 0.9;
		float b = 0.1 + pow(abs(sin(UV.x + time + PI / 3.0 * 2.0)), power) * 0.9;
		float border = 0.005;	
		bool is_border = (UV.x < border || UV.x > 1.0 - border) || (UV.y < border || UV.y > 1.0 - border);
		float offset = -0.1 * float(is_border);
		COLOR = vec4(r + offset, g + offset, b + offset, 1.0);
	}
//	float r = abs(sin(UV.x + time));
//	float g = abs(sin(UV.y + time));
//	float b = abs(sin(UV.x + time + PI / 2.0));
//	float a = 1.0 * float(is_border);
//	COLOR = vec4(r, g, b, a);
}
