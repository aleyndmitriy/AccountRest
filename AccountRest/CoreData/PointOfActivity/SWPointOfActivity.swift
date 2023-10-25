//
//  SWPointOfActivity.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 06/08/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

import Foundation

class SWPointOfActivity: Hashable{
    
    static var counter: Int = 0
    let number: String
    let code: String
    let name: String
    unowned let location: SWLocation
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(number)
    }
    
    init(number: String, code: String, name: String, location: SWLocation) {
        self.number = number
        self.code = code
        self.name = name
        self.location = location
        SWPointOfActivity.counter += 1
        print("Init SSWPointOfActivity quantity \(SWPointOfActivity.counter)")
    }
    
    convenience init(code: String, name: String, location: SWLocation) {
        self.init(number: UUID().uuidString, code: code, name: name, location: location)
    }
    
    deinit {
        SWPointOfActivity.counter -= 1
        print("Deinit SWPointOfActivity quantity \(SWPointOfActivity.counter)")
    }
    
    static func == (lhs: SWPointOfActivity, rhs: SWPointOfActivity) -> Bool {
        return (lhs.number == rhs.number)
    }
}
