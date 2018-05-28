//
//  ProductsProductsConfigurator.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ProductsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ProductsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ProductsViewController) {

        let router = ProductsRouter()

        let presenter = ProductsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ProductsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
