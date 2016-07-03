//
//  InputHandler.m
//  RomanUrnfieldKata
//
//  Created by Albert Devesa on 27/06/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import "InputHandler.h"
#import "NumberBase.h"
#import "ArabicNumber.h"
#import "UrnfieldNumber.h"
#import "RomanNumber.h"

@implementation InputHandler

- (NSString *)convertOneValue:(NSString *)inputValue withOutputType:(id<NumberBase>)outputType {
    
    NSArray *types = @[[ArabicNumber new],[UrnfieldNumber new],[RomanNumber new]];
    
    for (id<NumberBase> objClass in types) {
        
        id<NumberBase> objType = [objClass recognise:inputValue];
        
        if (objType) {
            
            return [outputType convertToString:objType.arabicValue];
        }
    }
    
    return nil;
}

- (NSString *)processInputScript:(NSString *)inputScript {
    
    NSString *result = @"";
    NSArray *lines=[inputScript componentsSeparatedByString:@"\n"];
    
    for (NSString *line in lines) {
        
        result = [result stringByAppendingString:line];
    }
    
    return result;
}

@end
