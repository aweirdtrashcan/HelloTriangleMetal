//
//  TriangleApp.m
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#import "TriangleAppDelegate.h"
#include "Renderer.h"
#include "RendererImpl.h"

@implementation TriangleAppDelegate
- (id)init
{
    NSRect rect = NSMakeRect(100, 100, 800, 600);
    
    _window = [[RendererWindow alloc] initWithRect:rect];
    
    _metalDevice = MTLCreateSystemDefaultDevice();
    
    //_metalView = [[MTKView alloc] initWithFrame:rect device:_metalDevice];
    
    NSString* name = [_metalDevice name];
    
    NSLog(@"Found metal device %@", name);
    
    //[_metalView setDelegate:self];
    //[_metalView setColorPixelFormat:MTLPixelFormatBGRA8Unorm_sRGB];
    //[_metalView setClearColor:MTLClearColorMake(1.0, 0.0, 0.0, 1.0)];
    //[_metalView setPreferredFramesPerSecond:10000];
    
    [[_window _window] setTitle:@"Stimply Engine Metal Test"];
    [[_window _window] makeKeyAndOrderFront:nil];
    
    _renderer = [[EngineRenderer alloc] initWithDevice:_metalDevice];
    
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    NSApplication* app = [notification object];
    [app activateIgnoringOtherApps:YES];
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    NSApplication* app = [notification object];
    [app setActivationPolicy:NSApplicationActivationPolicyRegular];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

- (void)drawInMTKView:(nonnull MTKView *)view {
    [_renderer draw: view];
}

- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size {

}

@end
