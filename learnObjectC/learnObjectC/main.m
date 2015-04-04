//
//  main.m
//  learnObjectC
//
//  Created by 逯晓瞳 on 15/4/3.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LearnPerson.h"
#import "LearnShoutingPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        LearnPerson *lpObj = [LearnPerson person];
        [lpObj sayHello];
        [lpObj sayNight];
        [lpObj sayHello1:1 Param2:2 Param3:3];
        
        LearnShoutingPerson *lspObj = [LearnShoutingPerson new];
        [lspObj sayHello];
        [lspObj sayNight];
        
        LearnPerson *lpObjNil;
        if ( lpObjNil == nil ) {
            NSLog(@"lpObjNil is nil");
        } else {
            NSLog(@"lpObjNil is not nil");
        }
        if ( lpObj == nil ) {
            NSLog(@"lpObj is nil");
        } else {
            NSLog(@"lpObj is not nil");
        }
    }
    return 0;
}
