//
//  SWAccount.swift
//  AccountRest
//
//  Created by Dmitrij Aleinikov on 10/11/17.
//  Copyright © 2017 Dmitrij Aleinikov. All rights reserved.
//

class SWAccount: Hashable{
    
    
    static var counter: Int = 0
    let number: String
    var sum: Double
    let nameOfBank: String
    
    convenience init(){
        self.init(number: "0", nameOfBank: "N/A")
    }
    
    init(number: String, sum: Double, nameOfBank: String){
        self.number = number
        self.sum = sum
        self.nameOfBank = nameOfBank
        SWAccount.counter += 1
        print("Init SWAccount quantity \(SWAccount.counter)")
    }
    var hashValue: Int {
        let hash1: Int = number.hash
        let hash2: Int = nameOfBank.hash
        return hash1^hash2
    }
    
    convenience init(number: String, nameOfBank: String){
       self.init(number: number, sum: 0.0, nameOfBank: nameOfBank)
    }
    
    convenience init(account:SWAccount){
        self.init(number: account.number, sum: account.sum, nameOfBank: account.nameOfBank)
    }
    
    deinit {
        self.sum = 0
        SWAccount.counter -= 1
        print("Deinit SWAccount quantity \(SWAccount.counter)")
    }
    
    class func quantityOfAccounts() -> Int{
        return SWAccount.counter
    }
    
    
    final class func == (left: SWAccount, right: SWAccount) -> Bool{
        return (left.number == right.number) && (left.nameOfBank == right.nameOfBank)
    }
    
}

func sortedByNameAndNumber(_ account1: SWAccount, _ account2: SWAccount)->Bool{
    if account1.nameOfBank == account2.nameOfBank{
        return account1.number > account2.number
    }
    else{
        return account1.nameOfBank > account2.nameOfBank
    }
}