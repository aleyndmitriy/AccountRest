//
//  SWProductCategory.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 28/08/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

import Foundation
class SWProductCategory: Hashable{
    
    static var counter: Int = 0
    let number: String
    let code: String
    let name: String
    
    var hashValue: Int {
        let hash1: Int = number.hash
        return hash1
    }
    
    init(number: String, code: String, name: String) {
        self.number = number
        self.code = code
        self.name = name
        SWProductCategory.counter += 1
        print("Init SWProductCategory quantity \(SWProductCategory.counter)")
    }
    
    convenience init(code: String, name: String) {
        self.init(number: UUID().uuidString, code: code, name: name)
    }
    
    deinit {
        SWProductCategory.counter -= 1
        print("Deinit SWProductCategory quantity \(SWProductCategory.counter)")
    }
    
    static func == (lhs: SWProductCategory, rhs: SWProductCategory) -> Bool {
        return (lhs.number == rhs.number)
    }
}
