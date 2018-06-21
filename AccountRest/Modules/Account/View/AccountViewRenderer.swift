//
//  AccountViewRenderer.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 17/06/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

import UIKit
import MetalKit

class AccountViewRenderer: NSObject {
    private var device: MTLDevice?
    private var commandQueue: MTLCommandQueue?
    private var pipelineState: MTLRenderPipelineState?
    private var vertexBuffer: MTLBuffer?
    private var indexBuffer: MTLBuffer?
    private var growing: Bool = true
    private var primaryChanel: Int = 0
    private var colorChannels: [Double] = [1.0, 0.0, 0.0, 1.0]
    private let dynamicColorRate: Double = 0.015
    private let initialVertices: [AccountViewVertex]
    private let indices: [UInt16]
    
    init(view: MTKView) {
        self.device = view.device
        if let device = self.device {
            self.initialVertices = [
                AccountViewVertex(position: vector_float3([-1, 1, 0]), color: vector_float4([1, 0, 0, 1])),
                AccountViewVertex(position: vector_float3([1, 1, 0]), color: vector_float4([0, 0, 1, 1])),
                AccountViewVertex(position: vector_float3([1, -1, 0]), color: vector_float4([1, 0, 0, 1])),
                AccountViewVertex(position: vector_float3([-1, -1, 0]), color: vector_float4([0, 1, 0, 1])),
                AccountViewVertex(position: vector_float3([0, 0, 1]), color: vector_float4([0, 1, 0, 1])),
                AccountViewVertex(position: vector_float3([0, 0, -1]), color: vector_float4([0, 0, 1, 1]))
            ]
            self.indices = [0, 5, 1, 1, 5, 2, 2, 5, 3, 3, 5, 0, 0, 1, 4, 4, 1, 2, 2, 3, 4, 4, 3, 0]
            self.vertexBuffer = device.makeBuffer(bytes: self.initialVertices, length: self.initialVertices.count * MemoryLayout<AccountViewVertex>.size, options: MTLResourceOptions.storageModeShared)
            self.indexBuffer = device.makeBuffer(bytes: self.indices, length: self.indices.count * MemoryLayout<UInt16>.size, options: MTLResourceOptions.storageModeShared)
            self.commandQueue = device.makeCommandQueue()
        }
        else {
            self.initialVertices = [AccountViewVertex]()
            self.indices = [UInt16]()
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

extension AccountViewRenderer: MTKViewDelegate {
    
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
