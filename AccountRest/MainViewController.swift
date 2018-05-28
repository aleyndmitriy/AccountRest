//
//  MainViewController.swift
//  AccountRest
//
//  Created by Dmitrij Aleinikov on 9/26/17.
//  Copyright © 2017 Dmitrij Aleinikov. All rights reserved.
//

import UIKit
import MetalKit

class MainViewController: UIViewController {

    var renderer: MainViewRenderer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let mtkView: MTKView = self.view as? MTKView else {
           return
        }
         mtkView.device = MTLCreateSystemDefaultDevice()
        if mtkView.device == nil {
            return
        }
        self.renderer = MainViewRenderer(view: mtkView)
        guard let rendererView = self.renderer else {
            return
        }
        mtkView.delegate = rendererView
        mtkView.preferredFramesPerSecond = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      self.navigationController?.setNavigationBarHidden(true, animated: false)
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnMainTouched(_ sender: UIButton) {
        if(sender.tag == 2){
            AccountsModuleInitializer.createModule()
        }
            
    }
    
}


