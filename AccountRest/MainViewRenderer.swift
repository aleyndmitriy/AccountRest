//
//  MainViewRenderer.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 28/05/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

import UIKit
import MetalKit

class MainViewRenderer: NSObject {
    
    private var device: MTLDevice?
    private var commandQueue: MTLCommandQueue?
    private var growing: Bool = true
    private var primaryChanel: Int = 0
    private var colorChannels: [Double] = [1.0, 0.0, 0.0, 1.0]
    private let dynamicColorRate: Double = 0.015
    
    init(view: MTKView) {
        self.device = view.device
        if let device = self.device {
            self.commandQueue = device.makeCommandQueue()
        }
        super.init()
    }
    
    func makeFancyColor()-> MTLClearColor {
        if self.growing {
            let dynamicChannelIndex: Int = (self.primaryChanel + 1)%3
            self.colorChannels[dynamicChannelIndex] += self.dynamicColorRate
            if self.colorChannels[dynamicChannelIndex] >= 1.0 {
                self.growing = false
                self.primaryChanel = dynamicChannelIndex
            }
        }
        else {
            let dynamicChannelIndex: Int = (self.primaryChanel + 2)%3
            self.colorChannels[dynamicChannelIndex] -= self.dynamicColorRate
            if self.colorChannels[dynamicChannelIndex] <= 0.0 {
                self.growing = true
            }
        }
        
        return MTLClearColor(red: self.colorChannels[0], green: self.colorChannels[1], blue: self.colorChannels[2], alpha: self.colorChannels[3])
    }
}

extension MainViewRenderer: MTKViewDelegate {
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        view.clearColor = self.makeFancyColor()
        guard let drawable: MTLDrawable = view.currentDrawable , let queue: MTLCommandQueue = self.commandQueue, let commandBuffer: MTLCommandBuffer = queue.makeCommandBuffer(), let descriptor: MTLRenderPassDescriptor = view.currentRenderPassDescriptor, let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor) else {
            return
        }
        commandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }

}
