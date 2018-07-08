//
//  Location.h
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 08/07/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#ifndef Location_h
#define Location_h
typedef struct {
    char address[MAX_ADDRESS_LENGTH];
    char uuid[UUID_LENGTH];
    double latitude;
    double longitude;
} Location

#endif /* Location_h */
