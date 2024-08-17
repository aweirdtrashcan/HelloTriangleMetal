//
//  RendererWindow.h
//  HelloTriangle
//
//  Created by Diego Rodrigues on 17/08/24.
//

#import <Foundation/Foundation.h>
#include <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RendererWindow : NSObject

@property(nonatomic, readwrite) NSWindow* _window;
@property(nonatomic, readwrite) NSView* _windowView;

-(RendererWindow*)initWithRect:(NSRect) rect;

@end

NS_ASSUME_NONNULL_END
