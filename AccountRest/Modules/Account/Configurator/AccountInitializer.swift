//
//  AccountAccountInitializer.swift
//  AccountRest
//
//  Created by Dmitriy on 02/06/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class AccountModuleInitializer: NSObject {
    static let storyboardName: String = "AccountBoard"
    
    class func createModule(configurationBlock: ((AccountModuleInput) -> Void)) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? AccountViewController else {
            return nil
        }
        let configurator = AccountModuleConfigurator()
        weak var wViewController = viewController
        configurator.configureModuleForViewInput(viewInput: wViewController)
        
        guard let moduleInput: AccountModuleInput = viewController.output as? AccountModuleInput else {
            return nil
        }
        configurationBlock(moduleInput);
        
        return viewController as UIViewController;
    }
}
