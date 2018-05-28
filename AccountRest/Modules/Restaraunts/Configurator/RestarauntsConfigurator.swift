//
//  RestarauntsRestarauntsConfigurator.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class RestarauntsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? RestarauntsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RestarauntsViewController) {

        let router = RestarauntsRouter()

        let presenter = RestarauntsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RestarauntsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
