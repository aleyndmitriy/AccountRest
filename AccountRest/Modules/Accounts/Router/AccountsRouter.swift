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
        let delegate:  AppDelegate? = UIApplication.shared.delegate as? AppDelegate
        if let del = delegate{
            let navController: UINavigationController? =  del.window?.rootViewController as? UINavigationController
            if let nav : UINavigationController = navController{
                nav.popViewController(animated: true)
            }
        }
    }
    deinit {
        print("deinit AccountsRouterInput")
    }
}
