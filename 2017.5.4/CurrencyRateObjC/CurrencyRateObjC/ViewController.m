//
//  ViewController.m
//  CurrencyRateObjC
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import "ViewController.h"
#import "Currency.h"
#import "AppManager.h"
#import "CurrencyCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray <Currency*> *collectionArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak ViewController *weakSelf = self;
    //__block int num = 5;
    
    [[AppManager sharedInstance] getCurrnciesWithBlock:^(NSArray<Currency *> *arr, NSError *err) {
        //num = 6;
        weakSelf.collectionArray = arr;
        [weakSelf.collectionView reloadData];
    }];
    
    /*
    NSDictionary *testDictionary = @{
                                     @"currency_code":@"AED",
                                     @"rate": @3.6725,
                                     @"code": @"AE",
                                     @"name": @"United Arab Emirates"
                                     };
    
    Currency *currency = [[Currency alloc] initWithDictionary:testDictionary];
    */
}


#pragma mark - UICollectionView -
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_collectionArray count];
}

- (__kindof UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CurrencyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    Currency *obj = _collectionArray[indexPath.row];
    [cell configureWithCurrency:obj];
    
    return cell;
    
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return collectionView.bounds.size;
    
}



@end


















