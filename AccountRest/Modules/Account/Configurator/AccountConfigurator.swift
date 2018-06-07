//
//  AccountAccountConfigurator.swift
//  AccountRest
//
//  Created by Dmitriy on 02/06/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class AccountModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AccountViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AccountViewController) {

        let router = AccountRouter()

        let presenter = AccountPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AccountInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
