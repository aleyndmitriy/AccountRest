//
//  SWLocation.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 08/07/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

import Foundation

class SWLocation: Hashable {
    
    static var counter: Int = 0
    let number: String
    let address: String
    var latitude: Double
    var longitude: Double
    
    var hashValue: Int {
        let hash1: Int = number.hash
        return hash1
    }
    
    init(number: String, address: String, latitude: Double, longitude: Double) {
        self.number = number
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        SWLocation.counter += 1
        print("Init SWLocation quantity \(SWLocation.counter)")
    }
    
    convenience init(number: String, address: String) {
        self.init(number: number, address: address, latitude: 0.00, longitude: 0.00)
    }
    
    convenience init(number: String) {
        self.init(number: number, address: String())
    }
    
    convenience init() {
        self.init(number: UUID().uuidString)
    }
    
    deinit {
        self.latitude = 0.00
        self.longitude = 0.00
        SWLocation.counter -= 1
        print("Deinit SWLocation quantity \(SWLocation.counter)")
    }
    
    static func == (lhs: SWLocation, rhs: SWLocation) -> Bool {
         return (lhs.number == rhs.number)
    }
    
    
}
