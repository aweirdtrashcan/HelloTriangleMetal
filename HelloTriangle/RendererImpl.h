//
//  RendererImpl.h
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#import <Foundation/Foundation.h>
#import "Renderer.h"

NS_ASSUME_NONNULL_BEGIN

@interface RendererImpl : NSObject<Renderer>
    
- (void)printSomethingToTheScreen:(NSString*)message;
- (void)printANumberToTheScreen:(int)number;

@end

NS_ASSUME_NONNULL_END
