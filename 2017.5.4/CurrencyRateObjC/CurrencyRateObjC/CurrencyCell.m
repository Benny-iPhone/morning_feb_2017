//
//  CurrencyCell.m
//  CurrencyRateObjC
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import "CurrencyCell.h"
#import "Currency.h"
@import SDWebImage;

@implementation CurrencyCell

- (void) configureWithCurrency:(Currency *)currency{
    [_imageView sd_setImageWithURL:[currency flagURL]];
    
    _rateLabel.text = [NSString stringWithFormat:@"%.3f",currency.rate];
    _countryNameLabel.text = currency.localizedCountryName;
    _currencyNameLabel.text = currency.localizedCurrencyName;
}

@end
