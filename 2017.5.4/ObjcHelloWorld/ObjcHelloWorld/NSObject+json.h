//
//  NSObject+json.h
//  ObjcHelloWorld
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (json)

- (NSData *) jsonData;
- (NSString *) jsonString;

@end
