//
//  Currency.m
//  CurrencyRateObjC
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import "Currency.h"

#define KEY_CODE @"code"
//macro with argument
#define kMulti(num) num*2

@implementation Currency


- (instancetype) initWithDictionary:(NSDictionary *)dict{
    if (self = [self init]) {

        self.currencyCode = dict[@"currency_code"];
        self.rate = [[dict objectForKey:@"rate"] doubleValue];
        self.countryCode = dict[KEY_CODE];
        
        self.localizedCountryName = [[NSLocale currentLocale] localizedStringForCountryCode:_countryCode];

        self.localizedCurrencyName = [[NSLocale currentLocale] displayNameForKey:NSLocaleCurrencyCode value:_currencyCode];
    }
    return self;
}

- (NSURL *) flagURL{
    //http://www.geognos.com/api/en/countries/flag/CN.png
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.geognos.com/api/en/countries/flag/%@.png",_countryCode];
    return [NSURL URLWithString:urlString];
}

//    NSArray *arr = @[@1,@2];
//    BOOL b = [arr count];
//    if (b == YES) {
//        //won't be called, YES is 1
//    }
    


@end











