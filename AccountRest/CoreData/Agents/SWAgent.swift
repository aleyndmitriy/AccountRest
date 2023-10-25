//
//  SWAgent.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 28/08/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

import Foundation
class SWAgent: Hashable{
    static var counter: Int = 0
    let number: String
    let companyName: String
    let contactName: String
    let phone: String
    let email: String
    var pointList: [SWPointOfActivity]?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.number)
    }
    
    init(number: String, companyName: String, contactName: String, phone: String, email: String) {
        self.number = number
        self.companyName = companyName
        self.contactName = contactName
        self.phone = phone
        self.email = email
        SWAgent.counter += 1
        print("Init SWAgent quantity \(SWAgent.counter)")
    }
    
    convenience init(companyName: String, contactName: String, phone: String, email: String) {
        self.init(number: UUID().uuidString, companyName: companyName, contactName: contactName, phone: phone, email: email)
    }
    
    deinit {
        self.pointList?.removeAll()
        self.pointList = nil
        SWAgent.counter -= 1
        print("Deinit SWAgent quantity \(SWAgent.counter)")
    }
    
    static func == (lhs: SWAgent, rhs: SWAgent) -> Bool {
        return (lhs.number == rhs.number)
    }
}
