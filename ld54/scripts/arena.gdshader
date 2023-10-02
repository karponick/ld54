shader_type spatial;

void fragment() {
	vec3 color;
	//color.r = (sin(TIME * 5.0) + 1.0) * 0.1;
	color.r = 0.005;
	color.g = 0.0;
	color.b = 0.0;
	ALBEDO = color;
	ROUGHNESS = 0.5;
	METALLIC = 1.0;
}