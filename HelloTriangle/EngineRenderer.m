//
//  EngineRenderer.m
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#import "EngineRenderer.h"

#include <stdio.h>
#include <string.h>

@implementation EngineRenderer
- (EngineRenderer*)initWithDevice:(id<MTLDevice>)device {
    _device = device;
    _commandQueue = [_device newCommandQueue];
    
    NSString* shaderCode = [self readDefaultShader];
    NSError* errorMessage;
    id<MTLLibrary> lib = [device newLibraryWithSource:shaderCode options:nil error:&errorMessage];
    
    if (lib == nil) {
        [NSException raise:@"Library error" format:@"Failed to create library %@", errorMessage];
    }
    
    id<MTLFunction> vertexFunc = [lib newFunctionWithName:@"vertexMain"];
    id<MTLFunction> fragmentFunc = [lib newFunctionWithName:@"fragmentMain"];
    
    MTLRenderPipelineDescriptor* descriptor = [[MTLRenderPipelineDescriptor alloc] init];
    [descriptor setVertexFunction:vertexFunc];
    [descriptor setFragmentFunction:fragmentFunc];
    
    MTLRenderPipelineColorAttachmentDescriptorArray* attachDescArray = [descriptor colorAttachments];
    [[attachDescArray objectAtIndexedSubscript:0] setPixelFormat:MTLPixelFormatBGRA8Unorm_sRGB];
    
    _renderPipeline = [device newRenderPipelineStateWithDescriptor:descriptor error:&errorMessage];
    
    if (_renderPipeline == nil) {
        [NSException raise:@"Pipeline failed" format:@"Failed to create pipeline %@", errorMessage];
    }
    
    return self;
}

- (NSString*)readDefaultShader {
    NSLog(@"Reading the pipeline");
    
    FILE* shaderFile = fopen("shaders/vertexshader.metal", "r");
    
    if (shaderFile == NULL) {
        [NSException raise:@"I/O Error" format:@"Failed to read default shader"];
    }
    
    char* buffer = malloc(2000);
    memset(buffer, 0, 2000);
    
    fread(buffer, 2000, 1, shaderFile);
    
    NSString* shaderText = [[NSString alloc] initWithUTF8String:buffer];
    
    free(buffer);
    
    return shaderText;
}

-(void) draw:(MTKView *)view {
    id<MTLCommandBuffer> commandBuffer = [_commandQueue commandBuffer];
    MTLRenderPassDescriptor* renderPass = [view currentRenderPassDescriptor];
    id<MTLRenderCommandEncoder> encoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPass];
    
    [encoder setRenderPipelineState:_renderPipeline];
    [encoder drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:3 instanceCount:1 baseInstance:0];
    
    [encoder endEncoding];
    [commandBuffer presentDrawable:[view currentDrawable]];
    [commandBuffer commit];
    
    //NSLog(@"Finished rendering");
}
@end
