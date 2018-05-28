//
//  ProductsProductsPresenter.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

class ProductsPresenter: ProductsModuleInput, ProductsViewOutput, ProductsInteractorOutput {

    weak var view: ProductsViewInput!
    var interactor: ProductsInteractorInput!
    var router: ProductsRouterInput!

    func viewIsReady() {

    }
}
