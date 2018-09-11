//
//  AccountShadersTypes.h
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 20/06/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#ifndef AccountShadersTypes_h
#define AccountShadersTypes_h

#include <simd/simd.h>

typedef enum AccountVertexInputIndex
{
    AccountViewVertexInputIndexVertices     = 0,
    AccountViewVertexInputIndexViewportSize = 1,
} AccountViewVertexInputIndex;

typedef struct
{
    // Positions in pixel space
    // (e.g. a value of 100 indicates 100 pixels from the center)
    vector_float4 position;
    // Floating-point RGBA colors
    vector_float4 color;
} AccountInputViewVertex;



typedef struct
{
    matrix_float4x4 modelViewMatrix;
    matrix_float4x4 projectionMatrix;
} Uniforms;
#endif /* AccountShadersTypes_h */
