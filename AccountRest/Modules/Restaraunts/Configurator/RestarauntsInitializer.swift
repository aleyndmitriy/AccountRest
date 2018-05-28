//
//  RestarauntsRestarauntsInitializer.swift
//  AccountRest
//
//  Created by ACR on 26/09/2017.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class RestarauntsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var restarauntsViewController: RestarauntsViewController!

    override func awakeFromNib() {

        let configurator = RestarauntsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: restarauntsViewController)
    }

}
