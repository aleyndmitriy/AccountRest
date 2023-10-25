//
//  AccountViewRenderer.swift
//  AccountRest
//
//  Created by Dmitriy Aleynikov on 17/06/2018.
//  Copyright © 2018 Dmitrij Aleinikov. All rights reserved.
//

import UIKit
import MetalKit

struct Uniforms {
    var modelViewMatrix: matrix_float4x4
    var projectionMatrix: matrix_float4x4
}

class AccountViewRenderer: NSObject {
    private var device: MTLDevice
    private var commandQueue: MTLCommandQueue
    private var pipelineState: MTLRenderPipelineState
    private var vertexBuffer: MTLBuffer
    private var indexBuffer: MTLBuffer
    private var uniformBuffer: MTLBuffer
    private var growing: Bool = true
    private var primaryChanel: Int = 0
    private var colorChannels: [Double] = [1.0, 0.0, 0.0, 1.0]
    private let dynamicColorRate: Double = 0.015
    private let initialVertices: [AccountInputViewVertex]
    private let indices: [UInt16]
    private var uniforms: Uniforms
    private var time: Float = 0
    
    init?(view: MTKView) {
        guard let device = view.device else {
            return nil
        }
        self.device = device
            self.initialVertices = [
                AccountInputViewVertex(position: vector_float4([-0.5, 0.5, 0.5, 1]), color: vector_float4([1, 0, 0, 1])),
                AccountInputViewVertex(position: vector_float4([-0.5, -0.5, 0.5, 1]), color: vector_float4([1, 0, 0, 1])),
                AccountInputViewVertex(position: vector_float4([0.5, -0.5, 0.5, 1]), color: vector_float4([1, 0, 0, 1])),
                AccountInputViewVertex(position: vector_float4([0.5, 0.5, 0.5, 1]), color: vector_float4([1, 0, 0, 1])),
                AccountInputViewVertex(position: vector_float4([-0.5, 0.5, -0.5, 1]), color: vector_float4([1, 0, 0, 1])),
                AccountInputViewVertex(position: vector_float4([-0.5, -0.5, -0.5, 1]), color: vector_float4([1, 0, 0, 1])),
                AccountInputViewVertex(position: vector_float4([0.5, -0.5, -0.5, 1]), color: vector_float4([1, 0, 0, 1])),
                AccountInputViewVertex(position: vector_float4([0.5, 0.5, -0.5, 1]), color: vector_float4([1, 0, 0, 1]))]
        self.indices = [3,2,6,6,7,3,
                        4,5,1,1,0,4,
                        4,0,3,3,7,4,
                        1,5,6,6,2,1,
                        0,1,2,2,3,0,
                        7,6,5,5,4,7]
        self.uniforms = Uniforms(modelViewMatrix: matrix_float4x4(1.0), projectionMatrix: matrix_float4x4(1.0))
        guard let vertexBuff = device.makeBuffer(bytes: self.initialVertices, length: self.initialVertices.count * MemoryLayout<AccountInputViewVertex>.stride, options: MTLResourceOptions.storageModeShared) else {
            return nil
        }
        self.vertexBuffer = vertexBuff
        guard let indexBuff = device.makeBuffer(bytes: self.indices, length: self.indices.count * MemoryLayout<UInt16>.stride, options: MTLResourceOptions.storageModeShared) else {
            return nil
        }
        self.indexBuffer = indexBuff
        
        guard let uniformBuff = device.makeBuffer(bytes: &(self.uniforms), length: MemoryLayout<Uniforms>.size, options: MTLResourceOptions.storageModeShared) else {
            return nil
        }
        self.uniformBuffer = uniformBuff
        
        guard let library = self.device.makeDefaultLibrary(), let vertexFunction: MTLFunction = library.makeFunction(name: "vertex_shader"), let fragmentFunction: MTLFunction = library.makeFunction(name: "fragment_shader") else {
            return nil
        }
        
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexFunction
        pipelineStateDescriptor.fragmentFunction = fragmentFunction
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        guard let pipeState = try? self.device.makeRenderPipelineState(descriptor: pipelineStateDescriptor) else {
            return nil
        }
        self.pipelineState = pipeState
        guard let commQueue = self.device.makeCommandQueue() else {
            return nil
        }
        self.commandQueue = commQueue
        view.clearColor = MTLClearColor(red: 1, green: 1, blue: 1, alpha: 1)
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
        guard let drawable: MTLDrawable = view.currentDrawable , let commandBuffer: MTLCommandBuffer = self.commandQueue.makeCommandBuffer(), let descriptor: MTLRenderPassDescriptor = view.currentRenderPassDescriptor, let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor) else {
            return
        }
        self.time += 1 / Float(view.preferredFramesPerSecond)
        self.uniforms.modelViewMatrix[0][0] = cos(self.time)
        self.uniforms.modelViewMatrix[1][1] = cos(self.time)
        self.uniforms.modelViewMatrix[0][1] = sin(self.time)
        self.uniforms.modelViewMatrix[1][0] = -sin(self.time)
        self.uniforms.modelViewMatrix[3][3] = 0
        commandEncoder.setRenderPipelineState(self.pipelineState)
        commandEncoder.setVertexBuffer(self.vertexBuffer, offset: 0, index: Int(AccountViewVertexInputIndexVertices.rawValue))
        self.uniformBuffer.contents().copyMemory(from: &(self.uniforms), byteCount: MemoryLayout<Uniforms>.size)
        commandEncoder.setVertexBuffer(self.uniformBuffer, offset: 0, index: Int(AccountViewVertexInputIndexViewportSize.rawValue))
        //commandEncoder.setVertexBytes(&self.uniforms, length: MemoryLayout<Uniforms>.size, index: Int(AccountViewVertexInputIndexViewportSize.rawValue))
        commandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: self.initialVertices.count)
        commandEncoder.drawIndexedPrimitives(type: .triangle, indexCount: self.indices.count, indexType: .uint16, indexBuffer: self.indexBuffer, indexBufferOffset: 0)
        
        commandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
