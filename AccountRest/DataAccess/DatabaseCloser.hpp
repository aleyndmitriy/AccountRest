//
//  DatabaseCloser.hpp
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 03/06/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

#ifndef DatabaseCloser_hpp
#define DatabaseCloser_hpp

#include <sqlite3.h>
class DatabaseCloser
{
public:
    void operator()(sqlite3* db);
};

#endif /* DatabaseCloser_hpp */
