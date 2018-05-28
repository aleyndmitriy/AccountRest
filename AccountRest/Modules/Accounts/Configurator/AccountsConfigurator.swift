//
//  AccountsAccountsConfigurator.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class AccountsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AccountsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AccountsViewController) {

        let router = AccountsRouter()

        let presenter = AccountsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AccountsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
