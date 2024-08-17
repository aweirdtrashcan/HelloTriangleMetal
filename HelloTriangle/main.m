//
//  main.m
//  HelloTriangle
//
//  Created by Diego Rodrigues on 16/08/24.
//

#import <Cocoa/Cocoa.h>

#include "TriangleAppDelegate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        
        [NSApplication sharedApplication];
        TriangleAppDelegate* delegate = [[TriangleAppDelegate alloc] init];
        [NSApp setDelegate:delegate];
        [NSApp run];
        
    }
    
    return 0;
}
