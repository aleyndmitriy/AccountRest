//
//  AccountShaders.metal
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 20/06/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#include <metal_stdlib>
#include "AccountShadersTypes.h"
using namespace metal;

typedef struct
{
    vector_float4 position [[position]];
    vector_float4 color;
} AccountViewOutputVertex;

vertex AccountViewOutputVertex vertex_shader(const device AccountInputViewVertex* vertices [[buffer(AccountViewVertexInputIndexVertices)]],  constant Uniforms &uniforms [[buffer(AccountViewVertexInputIndexViewportSize)]], uint vertexId [[vertex_id]]) {
    
    vector_float4 position =  uniforms.modelViewMatrix * (vertices + vertexId)->position;
    vector_float4 color = uniforms.modelViewMatrix * (vertices + vertexId)->color;
    
    AccountViewOutputVertex v_out;
    v_out.position = position;
    v_out.color = (vertices + vertexId)->color;
    return v_out;
}

fragment vector_float4 fragment_shader(AccountViewOutputVertex input [[stage_in]]) {
    return input.color;
}
