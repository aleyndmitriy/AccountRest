//
//  SWAccountViewCell.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 29/10/2017.
//  Copyright © 2017 Dmitrij Aleinikov. All rights reserved.
//

import UIKit


class SWAccountViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var accountNumber: UILabel!
    
    @IBOutlet weak var sum: UILabel!
    fileprivate var accountHash: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.sum.resignFirstResponder()
    }
    
    func setAccountAttributes(account: SWAccount)->Void{
        self.accountHash = account.hashValue
        self.accountNumber.text = account.number
        self.sum.text = "\(account.sum)"
    }

}

