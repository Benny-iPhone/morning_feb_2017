//
//  Person.h
//  ObjcHelloWorld
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
//@import Foundation;

@interface Person : NSObject
//{
//    NSString *firstName;
//}

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, assign) NSInteger age;

- (void) doSomething;
- (NSNumber *) returnNumber;

- (instancetype) initWithFirstname:(NSString *)firstname birthdate:(NSDate *)birthdate;

@end


















