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
    
    _metalDevice = MTLCreateSystemDefaultDevice();
    
    _window = [[NSWindow alloc] initWithContentRect:rect styleMask:NSWindowStyleMaskClosable | NSWindowStyleMaskTitled backing:NSBackingStoreBuffered defer:NO];
    
    _metalView = [[MTKView alloc] initWithFrame:rect device:_metalDevice];
    
    NSString* name = [_metalDevice name];
    
    NSLog(@"Found metal device %@", name);
    
    [_window setTitle:@"Stimply Engine Metal Test"];
    [_window makeKeyAndOrderFront:nil];
    [_window setIsVisible:YES];
    [_window setContentView:_metalView];
    
    [_metalView setColorPixelFormat:MTLPixelFormatBGRA8Unorm_sRGB];
    [_metalView setDelegate:self];
    //[_metalView setClearColor:MTLClearColorMake(1.0, 0.0, 0.0, 1.0)];
    // High limit because it'll be limited to the monitor's refresh rate anyways.
    [_metalView setPreferredFramesPerSecond: 10000];
    
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
    [_renderer draw:view];
}

- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size {
    
}

@end
