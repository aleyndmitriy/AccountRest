//
//  ProductCategory.h
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 28/08/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#ifndef ProductCategory_h
#define ProductCategory_h
typedef struct {
    char uuid[UUID_LENGTH];
    char name[MAX_NAME_LENGTH];
    char code[MAX_CODE_LENGTH];
} ProductCategory

#endif /* ProductCategory_h */
