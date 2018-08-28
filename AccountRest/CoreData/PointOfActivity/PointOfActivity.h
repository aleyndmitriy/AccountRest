//
//  PointOfActivity.h
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 06/08/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#ifndef PointOfActivity_h
#define PointOfActivity_h

typedef struct {
    char uuid[UUID_LENGTH];
    char code[MAX_CODE_LENGTH];
    char name[MAX_NAME_LENGTH];
    char locationUuid[UUID_LENGTH];
} PointOfActivity

#endif /* PointOfActivity_h */
