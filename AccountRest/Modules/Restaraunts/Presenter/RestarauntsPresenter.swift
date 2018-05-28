//
//  RestarauntsRestarauntsPresenter.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

class RestarauntsPresenter: RestarauntsModuleInput, RestarauntsViewOutput, RestarauntsInteractorOutput {

    weak var view: RestarauntsViewInput!
    var interactor: RestarauntsInteractorInput!
    var router: RestarauntsRouterInput!

    func viewIsReady() {

    }
}
