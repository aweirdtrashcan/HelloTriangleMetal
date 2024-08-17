//
//  RendererImpl.m
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#import "RendererImpl.h"

@implementation RendererImpl

- (void)printSomethingToTheScreen:(NSString*)message {
    NSLog(@"%@", message);
}

- (void)printANumberToTheScreen:(int)number {
    NSLog(@"%d", number);
}

@end
