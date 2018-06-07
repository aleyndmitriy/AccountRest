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
        if let delegate:  AppDelegate = UIApplication.shared.delegate as? AppDelegate, let navController: UINavigationController =  del.window?.rootViewController as? UINavigationController {
            navController.popViewController(animated: true)
        }
    }
    deinit {
        print("deinit AccountsRouterInput")
    }
}
