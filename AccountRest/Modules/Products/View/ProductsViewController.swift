//
//  ProductsProductsViewController.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, ProductsViewInput {

    var output: ProductsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ProductsViewInput
    func setupInitialState() {
    }
}
