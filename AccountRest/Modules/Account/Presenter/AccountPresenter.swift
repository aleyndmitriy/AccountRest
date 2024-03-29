//
//  AccountAccountPresenter.swift
//  AccountRest
//
//  Created by Dmitriy on 02/06/2018.
//  Copyright © 2018 Home. All rights reserved.
//

class AccountPresenter: AccountModuleInput, AccountViewOutput, AccountInteractorOutput {
    
    
    var account: SWAccount?
    

    weak var view: AccountViewInput!
    var interactor: AccountInteractorInput!
    var router: AccountRouterInput!

    func viewIsReady() {
        if let account: SWAccount = self.account {
            view.setAccountView(account: account)
        }
    }
    
    func backFromAccountViewToAccountsView() {
        router.backToAccountsView()
    }
}
