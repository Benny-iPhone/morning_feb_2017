//
//  AppManager.h
//  CurrencyRateObjC
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Currency;

typedef void(^CurrencyCompletion)(NSArray <Currency*>*,NSError *);

@interface AppManager : NSObject

+ (AppManager *) sharedInstance;

- (void) getCurrnciesWithBlock:(CurrencyCompletion)block;

@end



















