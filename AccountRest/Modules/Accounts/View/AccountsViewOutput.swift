//
//  AccountsAccountsViewOutput.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

protocol AccountsViewOutput {


    func viewIsReady()
    func backFromAccountsViewToMainView()->Void
    func numberOfSections()->Int
    func key(index:Int)->String?
    func keys()->[String]?
    func section(key:String)->[SWAccount]?
    func selected(key: Int, row: Int)
}
