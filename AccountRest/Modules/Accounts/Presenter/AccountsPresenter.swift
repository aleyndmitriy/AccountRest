//
//  AccountsAccountsPresenter.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

class AccountsPresenter: AccountsModuleInput, AccountsViewOutput, AccountsInteractorOutput {
    
    weak var view: AccountsViewInput!
    var interactor: AccountsInteractorInput!
    var router: AccountsRouterInput!
    var arrayAccount:[String]?
    var accountDictionary: [String:[SWAccount]]?
    
    func viewIsReady() {
        self.accountDictionary = [String:[SWAccount]]()
        var accounts1 = [SWAccount]()
        var accounts = [SWAccount]()
        accounts1.append(SWAccount(number: "12345", sum: 4.56, nameOfBank: "BelarusBank"))
        accounts.append(SWAccount(number: "asd123", sum: 5.76, nameOfBank: "MTBBank"))
        accounts.append(SWAccount(number: "qwert123", sum: 4.77, nameOfBank: "MTBBank"))
        self.accountDictionary?.updateValue(accounts1, forKey: "BelarusBank")
        self.accountDictionary?.updateValue(accounts, forKey: "MTBBank")
        self.arrayAccount = [String]()
        self.arrayAccount?.append("BelarusBank")
        self.arrayAccount?.append("MTBBank")
    }
    
    func backFromAccountsViewToMainView()->Void{
        router.backToMainView()
    }
    
    func numberOfSections()->Int{
        if self.accountDictionary != nil{
            return self.accountDictionary!.keys.count
        }
        else{
            return 0;
        }
    }
    
    func key(index:Int)->String?{
        if self.arrayAccount != nil{
            if index < self.arrayAccount!.count{
                return self.arrayAccount![index]
            }
            else{
                return nil
            }
        }
        else{
            return nil
        }
    }
    
    func keys()->[String]? {
        return self.arrayAccount
    }
    
    func section(key:String)->[SWAccount]?{
        if self.accountDictionary != nil{
            return self.accountDictionary![key]
        }
        else{
            return nil
        }
    }
    
    func selected(key: Int, row: Int) {
        guard let key: String = self.key(index: key), let accounts: [SWAccount] = self.section(key: key) else {
            return
        }
        self.router.openDetailScreen(account: accounts[row])
    }
    
    func didSumEdited(accountHash: Int, sum: String) {
        
    }
}
