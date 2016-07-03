//
//  RomanNumber.m
//  RomanUrnfieldKata
//
//  Created by Ken Corey on 03/07/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import "RomanNumber.h"

NSArray *denominations;

@interface RomanNumber ()

@end

@implementation RomanNumber  {
    
    NSInteger arabicValue;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        denominations = @[
                          @[@"M",@1000],
                          @[@"D",@500],
                          @[@"C",@100],
                          @[@"L",@50],
                          @[@"X",@10],
                          @[@"V",@5],
                          @[@"I",@1],
                          ];
    }
    return self;
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

- (NSString *)standardToCondensed:(NSString *)inputString {
    
    NSString *fivessearchString;
    NSString *fivesreplaceString;
    NSString *onessearchString;
    NSString *onesreplaceString;
    NSString *tenDenominationLabel;
    NSString *fiveDenominationLabel;
    NSString *oneDenominationLabel;
    NSString *result = inputString;
    
    for (int curDenomination = 2; curDenomination < [denominations count]; curDenomination += 2) {
        
        oneDenominationLabel = denominations[curDenomination][0];
        fiveDenominationLabel = denominations[curDenomination - 1][0];
        tenDenominationLabel = denominations[curDenomination - 2][0];
        
        fivessearchString = [NSString stringWithFormat:@"%@%@%@%@%@",fiveDenominationLabel,oneDenominationLabel,oneDenominationLabel,oneDenominationLabel,oneDenominationLabel];
        fivesreplaceString = [NSString stringWithFormat:@"%@%@",oneDenominationLabel,tenDenominationLabel];
        result = [result stringByReplacingOccurrencesOfString:fivessearchString withString:fivesreplaceString];
        
        onessearchString = [NSString stringWithFormat:@"%@%@%@%@",oneDenominationLabel,oneDenominationLabel,oneDenominationLabel,oneDenominationLabel];
        onesreplaceString = [NSString stringWithFormat:@"%@%@",oneDenominationLabel,fiveDenominationLabel];
        
        result = [result stringByReplacingOccurrencesOfString:onessearchString withString:onesreplaceString];
    }
    
    return result;
}

- (NSString *)condensedToStandard:(NSString *)inputString {
    
    NSString *fivessearchString;
    NSString *fivesreplaceString;
    NSString *onessearchString;
    NSString *onesreplaceString;
    NSString *tenDenominationLabel;
    NSString *fiveDenominationLabel;
    NSString *oneDenominationLabel;
    NSString *result = inputString;
    
    for (int curDenomination = 2; curDenomination < [denominations count]; curDenomination += 2) {
        
        oneDenominationLabel = denominations[curDenomination][0];
        fiveDenominationLabel = denominations[curDenomination - 1][0];
        tenDenominationLabel = denominations[curDenomination - 2][0];
        
        fivessearchString = [NSString stringWithFormat:@"%@%@",oneDenominationLabel,tenDenominationLabel];
        fivesreplaceString = [NSString stringWithFormat:@"%@%@%@%@%@",fiveDenominationLabel,oneDenominationLabel,oneDenominationLabel,oneDenominationLabel,oneDenominationLabel];
        result = [result stringByReplacingOccurrencesOfString:fivessearchString withString:fivesreplaceString];
        
        onessearchString = [NSString stringWithFormat:@"%@%@",oneDenominationLabel,fiveDenominationLabel];
        onesreplaceString = [NSString stringWithFormat:@"%@%@%@%@",oneDenominationLabel,oneDenominationLabel,oneDenominationLabel,oneDenominationLabel];
        
        result = [result stringByReplacingOccurrencesOfString:onessearchString withString:onesreplaceString];
    }
    
    return result;
}



- (NSInteger)convertToA:(NSString *)inputString {
    
    NSInteger result = 0;
    NSString *standardForm = [self condensedToStandard:inputString];
    NSInteger inputLength = [standardForm length];
    
    for (int i=0; i < inputLength; i++) {
        
        NSString *ichar  = [NSString stringWithFormat:@"%c", [standardForm characterAtIndex:i]];
        for (NSArray *denomination in denominations) {
            
            if ([denomination[0] isEqualToString:ichar]) {
                
                result += [denomination[1] integerValue];
            }
        }
    }
    
    return result;
}

- (NSString *)convertToString:(NSInteger)aValue {

    NSInteger remainder = aValue;
    NSString *accumulator = @"";

    for (NSArray *denomination in denominations) {

        while (remainder >= [denomination[1] integerValue]) {
            
            remainder -= [denomination[1] integerValue];
            
            accumulator = [NSString stringWithFormat:@"%@%@", accumulator, denomination[0]];
        }
    }
    
    return accumulator;
}

- (void)setArabicValue:(NSInteger)arabicValueIn {
    
    arabicValue = arabicValueIn;
}

- (NSInteger)arabicValue {
    
    return arabicValue;
}

@end
