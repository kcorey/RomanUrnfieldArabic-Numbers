//
//  RomanNumber.h
//  RomanUrnfieldKata
//
//  Created by Ken Corey on 03/07/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NumberBase.h"

@interface RomanNumber : NSObject <NumberBase>

- (NSString *)standardToCondensed:(NSString *)inputString;

- (NSString *)condensedToStandard:(NSString *)inputString;

@end
