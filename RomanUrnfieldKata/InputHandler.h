//
//  InputHandler.h
//  RomanUrnfieldKata
//
//  Created by Albert Devesa on 27/06/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NumberBase.h"

@interface InputHandler : NSObject

- (NSString *)convertOneValue:(NSString *)inputValue withOutputType:(id<NumberBase>)outputType;

@end
