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
    vector_float3 position;
    
    // Floating-point RGBA colors
    vector_float4 color;
} AccountViewVertex;

#endif /* AccountShadersTypes_h */
