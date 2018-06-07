//
//  AccountsAccountsRouter.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//
import UIKit

class AccountsRouter: AccountsRouterInput {
    
    func backToMainView()->Void{
        if let delegate:  AppDelegate = UIApplication.shared.delegate as? AppDelegate, let navController: UINavigationController =  delegate.window?.rootViewController as? UINavigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func openDetailScreen(account: SWAccount) {
        guard let controller: UIViewController = AccountModuleInitializer.createModule(configurationBlock: { (moduleInput: AccountModuleInput) in
            moduleInput.account = account
        }) else {
            return
        }
        if let accountController: AccountViewController = controller as? AccountViewController, let delegate:  AppDelegate = UIApplication.shared.delegate as? AppDelegate, let navController: UINavigationController =  delegate.window?.rootViewController as? UINavigationController {
            navController.pushViewController(accountController, animated: true)
        }
    }
    
    deinit {
        print("deinit AccountsRouterInput")
    }
}
