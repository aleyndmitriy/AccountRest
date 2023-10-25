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
    @IBOutlet weak var nameOfBank: UILabel!
    fileprivate var accountID: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setAccountAttributes(account: SWAccount)->Void{
        self.accountID = account.number
        self.accountNumber.text = self.accountID
        self.nameOfBank.text = account.nameOfBank
    }

}

