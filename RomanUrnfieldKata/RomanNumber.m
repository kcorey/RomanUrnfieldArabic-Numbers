//
//  RomanNumber.m
//  RomanUrnfieldKata
//
//  Created by Ken Corey on 03/07/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import "RomanNumber.h"

@implementation RomanNumber  {
    
    NSInteger arabicValue;
}

- (id<NumberBase>)recognise:(NSString *)inputString {
    
    if (inputString) {
        
        NSCharacterSet *unwantedCharacters =
        [[NSCharacterSet characterSetWithCharactersInString:@"IVXLCDM"] invertedSet];
        
        if ([inputString rangeOfCharacterFromSet:unwantedCharacters].location == NSNotFound) {
            
            RomanNumber *number = [RomanNumber new];
            
            number.arabicValue = [self convertToA:inputString];
            
            return number;
        }
    }
    
    return nil;
}

//- (NSInteger)valueOfChar:(NSString *)character {
//    
////    if ([character isEqualToString:@"/"]) {
////        
////        return 1;
////    }
////    if ([character isEqualToString:@"\\"]) {
////        
////        return 5;
////    }
//    return 0;
//}

- (NSInteger)convertToA:(NSString *)inputValue {
    
    NSInteger result = 1;
//    BOOL isOnes = YES;
//    
//    for (NSInteger index = 0; index < [inputValue length]; index++) {
//        NSString *character = [inputValue substringWithRange:NSMakeRange(index,1)];
//        
//        if (isOnes) {
//            
//            if ([character isEqualToString:@"/"]) {
//                
//                result += 1;
//            } else if ([character isEqualToString:@"\\"]) {
//                
//                result += 5;
//                isOnes = NO;
//            }
//        }
//        else {
//            
//            if ([character isEqualToString:@"/"]) {
//                
//                result = 0;
//            } else if ([character isEqualToString:@"\\"]) {
//                
//                result += 5;
//            }
//        }
//    }
    return result;
}

- (NSString *)convertToString:(NSInteger)aValue {
    
//    NSInteger fives = aValue / 5;
//    NSInteger ones = aValue % 5;
    NSString *accumulator = @"";
    
//    for (NSInteger index = 0; index < ones; index++) {
//        
//        accumulator = [accumulator stringByAppendingString:@"/"];
//    }
//    
//    for (NSInteger index = 0; index < fives; index++) {
//        
//        accumulator = [accumulator stringByAppendingString:@"\\"];
//    }
//    
    return accumulator;
}

- (void)setArabicValue:(NSInteger)arabicValueIn {
    
    arabicValue = arabicValueIn;
}

- (NSInteger)arabicValue {
    
    return arabicValue;
}

@end
