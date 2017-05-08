//
//  AppManager.m
//  CurrencyRateObjC
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import "AppManager.h"
#import "Currency.h"

@interface NSData (json)

- (id) jsonObjectWithError:(NSError **)error;

@end

@implementation AppManager

+ (AppManager *) sharedInstance{
    static AppManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    /*
    if (instance == nil) {
        @synchronized (self) {
            instance = [[self alloc] init];
        }
    }*/
    
    return instance;
}


- (void) getCurrnciesWithBlock:(CurrencyCompletion)block{
    NSString *urlString = @"http://www.mycurrency.net/service/rates";
    NSURL *url = [NSURL URLWithString:urlString];
    //[[NSURL alloc] initWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSArray *array = error == nil ? [data jsonObjectWithError:&error] : @[];
        NSMutableArray *finalArray = [NSMutableArray new];
        
        for (NSDictionary *dict in array) {
            Currency *c = [[Currency alloc] initWithDictionary:dict];
            [finalArray addObject:c];
        }
        
        //to to main thread
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            block(finalArray,error);
        }];
        /*
         go to main thread using GCD
        dispatch_async(dispatch_get_main_queue(), ^{
            block(finalArray,error);
        });
         */
        /*
         go to background thread using GCD
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            
        });
         */
        /*
         to to background thread using Operation Queue
        [[NSOperationQueue new] addOperationWithBlock:^{
            //do what ever
        }];
         */
        
    }] resume];
}

@end

@implementation NSData (json)

- (id) jsonObjectWithError:(NSError **)error{
    return [NSJSONSerialization JSONObjectWithData:self options:0 error:error];
}

@end
























