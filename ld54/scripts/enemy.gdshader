shader_type spatial;

void vertex() {
	//VERTEX.y += sin(TIME * 5.0 + VERTEX.x * 10.0) * 0.2;
}
void fragment() {
	vec3 color;
	color.r = (sin(TIME * 5.0 + VERTEX.x * 10.0) + 1.0) * 0.5;
	color.g = (sin(TIME * 6.0 + VERTEX.x * 10.0) + 1.0) * 0.5;
	color.b = (sin(TIME * 7.0 + VERTEX.x * 10.0) + 1.0) * 0.5;
	ALBEDO = color;
	ROUGHNESS = 0.5;
	METALLIC = 1.0;
}