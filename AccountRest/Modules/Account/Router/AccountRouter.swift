//
//  AccountAccountRouter.swift
//  AccountRest
//
//  Created by Dmitriy on 02/06/2018.
//  Copyright © 2018 Home. All rights reserved.
//
import UIKit

class AccountRouter: AccountRouterInput {
    func backToAccountsView() {
        if let delegate:  AppDelegate = UIApplication.shared.delegate as? AppDelegate, let navController: UINavigationController =  delegate.window?.rootViewController as? UINavigationController {
                navController.popViewController(animated: true)
        }
    }
}
