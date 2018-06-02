//
//  AccountsAccountsInitializer.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class AccountsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var accountsViewController: AccountsViewController!

    override func awakeFromNib() {
        let configurator = AccountsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: accountsViewController)
    }
    class func createModule()-> Void{
        let storyboard: UIStoryboard? = UIStoryboard(name: "AccountsBoard", bundle: nil)
        if let viewController: AccountsViewController = storyboard?.instantiateInitialViewController() as? AccountsViewController, let delegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate, let navController: UINavigationController =  delegate.window?.rootViewController as? UINavigationController {
            navController.pushViewController(viewController, animated: true)
        }
    }
    //MARK: Cheсk ARC
    override init() {
        super.init()
        print("init AccountsModuleInitializer")
    }
    deinit {
        print("deinit AccountsModuleInitializer")
    }
    
}
