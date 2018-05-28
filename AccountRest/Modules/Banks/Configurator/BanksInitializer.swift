//
//  BanksBanksInitializer.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class BanksModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var banksViewController: BanksViewController!

    override func awakeFromNib() {

        let configurator = BanksModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: banksViewController)
    }

}
