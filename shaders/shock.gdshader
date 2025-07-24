shader_type canvas_item;


uniform vec3 shock_color : source_color = vec3(1.0, 0.0, 0.0);
uniform float amplitude = 30.0;

uniform float frequecy = 10.0;
//this shader is shit btw)))
uniform bool work = true;

void vertex() {
	if (work ==true) {
		float exponent = mod(TIME, 1.0);
		VERTEX.x += amplitude * exp(-3.0*exponent) * sin(frequecy*exponent);
	}
}

void fragment() {
	if (work==true) {
		float exponent = mod(TIME, 1.0);
		vec3 normal_color = texture(TEXTURE, UV).rgb;
		COLOR.rgb = normal_color + shock_color * exp(-3.0*exponent);
	}
}