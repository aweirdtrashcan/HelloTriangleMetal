//
//  vertexshader.metal
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#include <metal_stdlib>
using namespace metal;

struct Vertex {
    Vertex(float4 position, float4 color)
    :
    position(position),
    color(color) {}
    
    float4 position [[position]];
    float4 color;
};

constant Vertex vertices[] = {
    Vertex(float4(0.5, -0.5, 0.0, 1.0), float4(1.0, 0.0, 0.0, 1.0)),
    Vertex(float4(-0.5, -0.5, 0.0, 1.0), float4(0.0, 0.0, 1.0, 1.0)),
    Vertex(float4(0.0, 0.5, 0.0, 1.0), float4(0.0, 1.0, 0.0, 1.0))
};

Vertex vertex vertexMain(uint vid [[vertex_id]]) {
    Vertex vert = vertices[vid];
    
    return vert;
}

float4 fragment fragmentMain(Vertex vert [[stage_in]]) {
    return vert.color;
}
