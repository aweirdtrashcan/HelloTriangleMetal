//
//  TriangleApp.h
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#import <Foundation/Foundation.h>
#import <MetalKit/MetalKit.h>
#import <Cocoa/Cocoa.h>

#import "EngineRenderer.h"
#include "RendererWindow.h"

NS_ASSUME_NONNULL_BEGIN

@interface TriangleAppDelegate : NSObject<NSApplicationDelegate, MTKViewDelegate>
{
    RendererWindow* _window;
    id<MTLDevice> _metalDevice;
    EngineRenderer* _renderer;
}


@end

NS_ASSUME_NONNULL_END
