//
//  RomanNumberTests.m
//  RomanUrnfieldKata
//
//  Created by Ken Corey on 03/07/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InputHandler.h"
#import "RomanNumber.h"
#import "ArabicNumber.h"
#import "UrnfieldNumber.h"

@interface RomanNumberTests : XCTestCase

@end

@implementation RomanNumberTests

- (void)testNoInputWasGiven {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *output = [handler convertOneValue:nil withOutputType:[RomanNumber new]];
    
    XCTAssertNil(output);
}

- (void)testRomanRecognise {
    
    NSString *inputString = @"I";
    
    id<NumberBase> result = [[RomanNumber new] recognise:inputString];
    
    XCTAssertNotNil(result);
    XCTAssertEqual(result.arabicValue, 1);
}

- (void)testRomanRecogniseTen {
    
    NSString *inputString = @"X";
    
    id<NumberBase> result = [[RomanNumber new] recognise:inputString];
    
    XCTAssertNotNil(result);
    XCTAssertEqual(((RomanNumber *)(result)).arabicValue, 10);
}

- (void)testUrnfieldReturnsSix {
    
    NSInteger inputValue = 6;
    
    NSString *result = [[RomanNumber new] convertToString:inputValue];
    
    XCTAssertNotNil(result);
    XCTAssertEqualObjects(result, @"VI");
}

- (void)testInputSingleDigitRomanToRoman {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"X";
    NSString *desiredOutput = @"X";
    
    NSString *output = [handler convertOneValue:input withOutputType:[RomanNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testInputdoubleDigitUrnfieldToArabic {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"II";
    NSString *desiredOutput = @"2";
    
    NSString *output = [handler convertOneValue:input withOutputType:[ArabicNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testConvertstandardToCondensedform4 {
    
    NSString *input = @"IIII";
    NSString *desiredOutput = @"IV";
    RomanNumber *romanNumber = [RomanNumber new];
    
    NSString *output = [romanNumber standardToCondensed:input];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testConvertstandardToCondensedform19 {
    
    NSString *input = @"XVIIII";
    NSString *desiredOutput = @"XIX";
    RomanNumber *romanNumber = [RomanNumber new];
    
    NSString *output = [romanNumber standardToCondensed:input];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testConvertCondensedToStandard19 {
    
    NSString *input = @"XIX";
    NSString *desiredOutput = @"XVIIII";
    RomanNumber *romanNumber = [RomanNumber new];
    
    NSString *output = [romanNumber condensedToStandard:input];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testConvertCondensedToStandard4 {
    
    NSString *input = @"IV";
    NSString *desiredOutput = @"IIII";
    RomanNumber *romanNumber = [RomanNumber new];
    
    NSString *output = [romanNumber condensedToStandard:input];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testInputFour {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"IV";
    NSString *desiredOutput = @"4";
    
    NSString *output = [handler convertOneValue:input withOutputType:[ArabicNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testInput29 {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"XXIX";
    NSString *desiredOutput = @"29";
    
    NSString *output = [handler convertOneValue:input withOutputType:[ArabicNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testInput1999 {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"MCMXCIX";
    NSString *desiredOutput = @"1999";
    
    NSString *output = [handler convertOneValue:input withOutputType:[ArabicNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testInputTwentyFour {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"XXIIII";
    NSString *desiredOutput = @"24";
    
    NSString *output = [handler convertOneValue:input withOutputType:[ArabicNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testConversionToUrnfield {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"XXIIII";
    NSString *desiredOutput = @"////\\\\\\\\";
    
    NSString *output = [handler convertOneValue:input withOutputType:[UrnfieldNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}



@end
