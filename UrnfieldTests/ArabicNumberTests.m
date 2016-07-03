//
//  ArabicNumberTests.m
//  RomanUrnfieldKata
//
//  Created by Ken Corey on 27/06/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InputHandler.h"
#import "ArabicNumber.h"
#import "UrnfieldNumber.h"

@interface ArabicNumberTests : XCTestCase

@end

@implementation ArabicNumberTests

- (void)testNoInputWasGiven {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *output = [handler convertOneValue:nil withOutputType:[UrnfieldNumber new]];
    
    XCTAssertNil(output);
}

- (void)testArabicRecognise {
    
    NSString *inputString = @"3";
    
    id<NumberBase> result = [[ArabicNumber new] recognise:inputString];
    
    XCTAssertNotNil(result);
    XCTAssertEqual(result.arabicValue, 3);
}

- (void)testArabicRecogniseTen {
    
    NSString *inputString = @"10";
    
    id<NumberBase> result = [[ArabicNumber new] recognise:inputString];
    
    XCTAssertNotNil(result);
    XCTAssertEqual(((ArabicNumber *)(result)).arabicValue, 10);
}

- (void)testArabicReturnsSix {
    
    NSInteger inputValue = 6;
    
    NSString *result = [[ArabicNumber new] convertToString:inputValue];
    
    XCTAssertNotNil(result);
    XCTAssertEqualObjects(result, @"6");
}

- (void)testInputSingleDigitArabicToUrnfield {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"17";
    NSString *desiredOutput = @"//\\\\\\";
    
    NSString *output = [handler convertOneValue:input withOutputType:[UrnfieldNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testInputdoubleDigitArabicToUrnfield {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"42";
    NSString *desiredOutput = @"//\\\\\\\\\\\\\\\\";
    
    NSString *output = [handler convertOneValue:input withOutputType:[UrnfieldNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testInputIncorrectValue {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"0123456789";
    NSString *desiredOutput = @"123456789";
    
    NSString *output = [handler convertOneValue:input withOutputType:[ArabicNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}
@end
