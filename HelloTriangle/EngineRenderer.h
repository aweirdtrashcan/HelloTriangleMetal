//
//  EngineRenderer.h
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#import <Foundation/Foundation.h>
#import <MetalKit/MetalKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EngineRenderer : NSObject
{
    id<MTLDevice> _device;
    id<MTLCommandQueue> _commandQueue;
    id<MTLRenderPipelineState> _renderPipeline;
}
-(EngineRenderer*) initWithDevice:(id<MTLDevice>) device;
-(NSString*) readDefaultShader;
-(void) draw:(MTKView*) view;
@end

NS_ASSUME_NONNULL_END
