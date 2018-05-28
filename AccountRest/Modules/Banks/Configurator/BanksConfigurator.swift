//
//  BanksBanksConfigurator.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class BanksModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? BanksViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: BanksViewController) {

        let router = BanksRouter()

        let presenter = BanksPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = BanksInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
