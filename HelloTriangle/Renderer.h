//
//  Renderer.h
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Renderer <NSObject>
-(void) printSomethingToTheScreen:(NSString*)text;
-(void) printANumberToTheScreen:(int)number;
@end

NS_ASSUME_NONNULL_END
