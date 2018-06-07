//
//  DatabaseCloser.cpp
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 03/06/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#include "DatabaseCloser.hpp"

void DatabaseCloser::operator()(sqlite3 *db)
{
    if(db != nullptr) {
        int state = sqlite3_close_v2(db);
        if(state != SQLITE_OK) {
            const char* error = sqlite3_errmsg(db);
        }
    }
    
}
