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
    var renderer: MainViewRenderer?
    
    @IBAction func btnBackTouched(_ sender: UIButton) {
        self.output.backFromAccountViewToAccountsView()
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let mtkView: MTKView = self.view as? MTKView else {
            return
        }
        self.renderView.device = MTLCreateSystemDefaultDevice()
        if self.renderView.device == nil {
            return
        }
        self.renderer = MainViewRenderer(view: self.renderView)
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
}
