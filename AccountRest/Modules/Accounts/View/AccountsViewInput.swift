//
//  AccountsAccountsViewInput.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//


protocol AccountsViewInput: AnyObject {

    func setupInitialState()
    func startLoading()
    func reloadViewSection(index: Int)
    func reloadViewTable()
}
