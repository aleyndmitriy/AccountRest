//
//  Agent.h
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 28/08/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#ifndef Agent_h
#define Agent_h

typedef struct {
    char uuid[UUID_LENGTH];
    char companyName[MAX_NAME_LENGTH];
    char contactName[MAX_NAME_LENGTH];
    char phone[MAX_CODE_LENGTH];
    char email[MAX_CODE_LENGTH];
    int pointNumber;
    char pointUuids[];
} Agent

#endif /* Agent_h */
