//
//  AccountAccountPresenter.swift
//  AccountRest
//
//  Created by Dmitriy on 02/06/2018.
//  Copyright © 2018 Home. All rights reserved.
//

class AccountPresenter: AccountModuleInput, AccountViewOutput, AccountInteractorOutput {

    weak var view: AccountViewInput!
    var interactor: AccountInteractorInput!
    var router: AccountRouterInput!

    func viewIsReady() {

    }
    
    func backFromAccountViewToAccountsView() {
        router.backToAccountsView()
    }
}
