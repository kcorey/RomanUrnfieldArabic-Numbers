//
//  UrnfieldTests.m
//  UrnfieldTests
//
//  Created by Albert Devesa on 27/06/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InputHandler.h"
#import "ArabicNumber.h"
#import "UrnfieldNumber.h"


@interface UrnfieldTests : XCTestCase

@end

@implementation UrnfieldTests

- (void)testNoInputWasGiven {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *output = [handler convertOneValue:nil withOutputType:[ArabicNumber new]];
    
    XCTAssertNil(output);
}

- (void)testUrnfieldRecognise {
    
    NSString *inputString = @"/";
    
    id<NumberBase> result = [[UrnfieldNumber new] recognise:inputString];
    
    XCTAssertNotNil(result);
    XCTAssertEqual(result.arabicValue, 1);
}

- (void)testUrnfieldRecogniseTen {
    
    NSString *inputString = @"\\\\";
    
    id<NumberBase> result = [[UrnfieldNumber new] recognise:inputString];
    
    XCTAssertNotNil(result);
    XCTAssertEqual(((UrnfieldNumber *)(result)).arabicValue, 10);
}

- (void)testUrnfieldReturnsSix {
    
    NSInteger inputValue = 6;
    
    NSString *result = [[UrnfieldNumber new] convertToString:inputValue];
    
    XCTAssertNotNil(result);
    XCTAssertEqualObjects(result, @"/\\");
}

- (void)testInputSingleDigitUrnfieldToUrnfield {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"//";
    NSString *desiredOutput = @"//";
    
    NSString *output = [handler convertOneValue:input withOutputType:[UrnfieldNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testInputdoubleDigitUrnfieldToArabic {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"//";
    NSString *desiredOutput = @"2";
    
    NSString *output = [handler convertOneValue:input withOutputType:[ArabicNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}

- (void)testInputIncorrectValue {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *input = @"\\\\//";
    NSString *desiredOutput = @"0";
    
    NSString *output = [handler convertOneValue:input withOutputType:[ArabicNumber new]];
    
    XCTAssertEqualObjects(output,desiredOutput);
}
@end
