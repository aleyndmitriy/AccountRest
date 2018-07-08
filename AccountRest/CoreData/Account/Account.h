//
//  Account.h
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 30/06/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#ifndef Account_h
#define Account_h
#include"Consts.h"

typedef struct {
    char uuid[UUID_LENGTH];
    char nameOfBank[MAX_NAME_LENGTH];
    double sum;
} Account;

#endif /* Account_h */
