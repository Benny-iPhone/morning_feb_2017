//
//  Currency.h
//  CurrencyRateObjC
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject

@property (nonatomic, strong) NSString *currencyCode;
@property (nonatomic, assign) double rate;
@property (nonatomic, strong) NSString *countryCode;

@property (nonatomic, strong) NSString *localizedCountryName;
@property (nonatomic, strong) NSString *localizedCurrencyName;

- (NSURL *) flagURL;

- (instancetype) initWithDictionary:(NSDictionary *)dict;

@end

















