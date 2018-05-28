//
//  ProductsProductsInitializer.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ProductsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var productsViewController: ProductsViewController!

    override func awakeFromNib() {

        let configurator = ProductsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: productsViewController)
    }

}
