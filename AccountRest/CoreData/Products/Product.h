//
//  Product.h
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 28/08/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#ifndef Product_h
#define Product_h

typedef struct {
    char uuid[UUID_LENGTH];
    char productName[MAX_NAME_LENGTH];
    char supplierId[UUID_LENGTH];
    char categoryId[UUID_LENGTH];
    double price;
    bool discontinued;
} Product

#endif /* Product_h */
