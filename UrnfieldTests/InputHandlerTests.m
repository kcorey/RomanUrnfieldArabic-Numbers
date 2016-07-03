//
//  InputHandlerTests.m
//  RomanUrnfieldKata
//
//  Created by Ken Corey on 03/07/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InputHandler.h"

@interface InputHandlerTests : XCTestCase

@end

@implementation InputHandlerTests

- (void)testCanHandleNilInput {
    
    InputHandler *handler = [InputHandler new];
    
    NSString *result = [handler processInputScript:nil];
    
    XCTAssertEqualObjects(result,@"");
}

- (void)testCanHandleEmptyString {
    
    InputHandler *handler = [InputHandler new];
    NSString *inputString = @"";
    
    NSString *result = [handler processInputScript:inputString];
    
    XCTAssertEqualObjects(result,@"");
}

- (void)testCanHandleNonNumberSingleLine {
    
    InputHandler *handler = [InputHandler new];
    NSString *inputString = @"Foobery";
    NSString *desiredOutputString = @"Foobery";
    
    NSString *result = [handler processInputScript:inputString];
    
    XCTAssertEqualObjects(result,desiredOutputString);
}

@end
