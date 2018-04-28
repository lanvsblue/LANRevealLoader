//
//  LANRevealLoader.mm
//  LANRevealLoader
//
//  Created by 蓝布鲁 on 2018/4/28.
//  Copyright (c) 2018年 ___ORGANIZATIONNAME___. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#define REVEAL_SERVER_PATH @"/Library/TweakInject/RevealServer"

#import <Foundation/Foundation.h>
#import "CaptainHook/CaptainHook.h"
#include <notify.h> // not required; for examples only
#include <dlfcn.h>

// Objective-C runtime hooking using CaptainHook:
//   1. declare class using CHDeclareClass()
//   2. load class using CHLoadClass() or CHLoadLateClass() in CHConstructor
//   3. hook method using CHOptimizedMethod()
//   4. register hook using CHHook() in CHConstructor
//   5. (optionally) call old method using CHSuper()


__attribute__((constructor)) static void entry() {
    @autoreleasepool
    {
        NSLog(@"########## [Reveal 4] Loading by lanvsblue ##########");
        NSString *libraryPath = REVEAL_SERVER_PATH;
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]){
            dlopen([libraryPath UTF8String], RTLD_NOW);
            NSLog(@"########## [Reveal 4] Loaded by lanvsblue ##########");
        }
    }
}

