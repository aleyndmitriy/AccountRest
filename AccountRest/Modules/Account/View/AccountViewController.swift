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
    @IBOutlet weak var renderView: MTKView!
    var renderer: AccountViewRenderer?
    
    @IBAction func btnBackTouched(_ sender: UIButton) {
        self.output.backFromAccountViewToAccountsView()
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.renderView.device = MTLCreateSystemDefaultDevice()
        if self.renderView.device == nil {
            return
        }
        self.renderer = AccountViewRenderer(view: self.renderView)
        guard let rendererView = self.renderer else {
            return
        }
        self.renderView.delegate = rendererView
        self.renderView.preferredFramesPerSecond = 60
        output.viewIsReady()
    }


    // MARK: AccountViewInput
    func setupInitialState() {
    }
    
    func setAccountView(account: SWAccount) {
        self.lblNameOfBank.text = account.nameOfBank
        self.lblNumber.text = account.number
        self.txtSum.text = String(format: "%f.2", account.sum)
    }
}

extension AccountViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     if let text = textField.text, let range = Range(range, in: text) {
     let supposedText = text.replacingCharacters(in: range, with: string)
     //self.delegate?.didSumEdited(accountHash: self.accountHash, sum: supposedText)
     }
     return true
     }
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     self.txtSum.resignFirstResponder()
     return true
     }
}
