//
//  SWProduct.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 28/08/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

import Foundation

class SWProduct: Hashable{
    static var counter: Int = 0
    let number: String
    let productName: String
    let supplierId: String
    let categoryId: String
    let price: Double
    let discontinued: Bool
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(number)
    }
    
    init(number: String, productName: String, supplierId: String, categoryId: String, price: Double, discontinued: Bool) {
        self.number = number
        self.productName = productName
        self.supplierId = supplierId
        self.categoryId = categoryId
        self.price = price
        self.discontinued = discontinued
        SWProduct.counter += 1
        print("Init SWProduct quantity \(SWProduct.counter)")
    }
    
    convenience init(productName: String,  supplierId: String, categoryId: String, price: Double, discontinued: Bool) {
        self.init(number: UUID().uuidString, productName: productName, supplierId: supplierId, categoryId: categoryId, price: price, discontinued: discontinued)
    }
    
    deinit {
        SWProduct.counter -= 1
        print("Deinit SWProduct quantity \(SWProduct.counter)")
    }
    
    static func == (lhs: SWProduct, rhs: SWProduct) -> Bool {
        return (lhs.number == rhs.number)
    }
}
