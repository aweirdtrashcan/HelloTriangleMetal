//
//  RendererWindow.m
//  HelloTriangle
//
//  Created by Diego Rodrigues on 17/08/24.
//

#import "RendererWindow.h"

@implementation RendererWindow
- (RendererWindow *)initWithRect:(NSRect)rect {
    [self set_window:[[NSWindow alloc] initWithContentRect:rect styleMask:NSWindowStyleMaskClosable | NSWindowStyleMaskTitled backing:NSBackingStoreBuffered defer:NO]];
    
    _view = [[NSView alloc] initWithFrame:rect];
    
    return self;
}
@end
