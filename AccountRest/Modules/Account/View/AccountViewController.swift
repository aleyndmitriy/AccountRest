//
//  AccountAccountViewController.swift
//  AccountRest
//
//  Created by Dmitriy on 02/06/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit
import MetalKit

class AccountViewController: UIViewController, AccountViewInput {

    var output: AccountViewOutput!
    @IBOutlet weak var lblNameOfBank: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var txtSum: UITextField!
    
    
    @IBAction func btnBackTouched(_ sender: UIButton) {
        self.output.backFromAccountViewToAccountsView()
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AccountViewInput
    func setupInitialState() {
    }
}
