//
//  Person.m
//  ObjcHelloWorld
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (nonatomic, strong) NSDate *birthdate;

@end

@implementation Person

@synthesize birthdate = bDate;

- (instancetype) initWithFirstname:(NSString *)firstname birthdate:(NSDate *)birthdate{
    
    if (self = [super init]) {
        self.firstName = firstname;
        self.birthdate = birthdate;
        
    }
    return self;
    
}

- (void) setFirstName:(NSString *)firstName{
    firstName = [firstName stringByAppendingString:@" 😀"];
    _firstName = firstName;
}

- (void) doSomething{
    NSLog(@"doing something");
}

- (NSNumber *) returnNumber{
    //return [[NSNumber alloc] initWithInt:100];
    return @100;
}

@end















