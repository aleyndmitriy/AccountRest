//
//  AccountAccountViewInput.swift
//  AccountRest
//
//  Created by Dmitriy on 02/06/2018.
//  Copyright © 2018 Home. All rights reserved.
//

protocol AccountViewInput: AnyObject {

    func setupInitialState()
    func setAccountView(account: SWAccount)
}
