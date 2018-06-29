//
//  VTManager.m
//  videotimer
//
//  Created by Suxin on 11/19/17.
//  Copyright © 2017 Suxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VTManager.h"

@implementation VTManager

+(BOOL)isPhoneX
{
    CGSize size = UIScreen.mainScreen.currentMode.size;
    return MAX(size.height, size.width) / MIN(size.height, size.width) > 2.1;
}

@end
