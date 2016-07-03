//
//  NumberBase.h
//  RomanUrnfieldKata
//
//  Created by Albert Devesa on 27/06/2016.
//  Copyright © 2016 CrowdLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NumberBase <NSObject>

@property (nonatomic,assign) NSInteger arabicValue;

- (id<NumberBase>)recognise:(NSString *)inputString;
- (NSInteger)convertToA:(NSString *)inputValue;
- (NSString *)convertToString:(NSInteger)aValue;

@end
