//
//  SWAccountViewCell.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 29/10/2017.
//  Copyright © 2017 Dmitrij Aleinikov. All rights reserved.
//

import UIKit

protocol SWAccountViewCellDelegate: class {
     func didSumEdited(accountHash: Int, sum: String)
}

class SWAccountViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var accountNumber: UILabel!
    
    @IBOutlet weak var sum: UITextField!
    fileprivate var accountHash: Int = 0
    fileprivate var delegate: SWAccountViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.addGestureRecognizer(gesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setAccountAttributes(account: SWAccount, delegate: SWAccountViewCellDelegate?)->Void{
        self.accountHash = account.hashValue
        self.accountNumber.text = account.number
        self.sum.delegate = self
        self.sum.keyboardType = .decimalPad
        self.sum.text = "\(account.sum)"
        self.delegate = delegate
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let range = Range(range, in: text) {
            let supposedText = text.replacingCharacters(in: range, with: string)
            self.delegate?.didSumEdited(accountHash: self.accountHash, sum: supposedText)
        }
        return true
    }
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        self.sum.resignFirstResponder()
    }
}
