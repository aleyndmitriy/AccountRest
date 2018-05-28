//
//  BanksBanksPresenter.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

class BanksPresenter: BanksModuleInput, BanksViewOutput, BanksInteractorOutput {

    weak var view: BanksViewInput!
    var interactor: BanksInteractorInput!
    var router: BanksRouterInput!

    func viewIsReady() {

    }
}
