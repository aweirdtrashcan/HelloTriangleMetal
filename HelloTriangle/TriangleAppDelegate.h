//
//  TriangleApp.h
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

#import "EngineRenderer.h"

NS_ASSUME_NONNULL_BEGIN

@interface TriangleAppDelegate : NSObject<NSApplicationDelegate, MTKViewDelegate>
{
    NSWindow* _window;
    id<MTLDevice> _metalDevice;
    MTKView* _metalView;
    EngineRenderer* _renderer;
}

@end

NS_ASSUME_NONNULL_END
