//
//  NSObject+json.m
//  ObjcHelloWorld
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import "NSObject+json.h"

@implementation NSObject (json)

- (NSData *) jsonData{
    return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
}
- (NSString *) jsonString{
    return [[NSString alloc] initWithData:[self jsonData] encoding:NSUTF8StringEncoding];
}


@end
