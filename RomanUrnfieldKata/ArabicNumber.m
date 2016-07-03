//
//  ArabicNumber.m
//  RomanUrnfieldKata
//
//  Created by Albert Devesa on 27/06/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import "ArabicNumber.h"

@implementation ArabicNumber {
    
    NSInteger arabicValue;
}

- (id<NumberBase>)recognise:(NSString *)inputString {
    
    if (inputString) {
        
        NSCharacterSet *unwantedCharacters =
        [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        
        if ([inputString rangeOfCharacterFromSet:unwantedCharacters].location == NSNotFound) {
            
            ArabicNumber *number = [ArabicNumber new];
            
            number.arabicValue = [self convertToA:inputString];
            
            return number;
        }
    }
    
    return nil;
}

- (NSInteger)convertToA:(NSString *)inputValue {
    
    NSInteger result = [inputValue integerValue];
    
    return result;
}

- (NSString *)convertToString:(NSInteger)aValue {
    
    return [NSString stringWithFormat:@"%ld",aValue];
}

- (void)setArabicValue:(NSInteger)arabicValueIn {
    
    arabicValue = arabicValueIn;
}

- (NSInteger)arabicValue {
    
    return arabicValue;
}


@end
