//
//  ViewController.m
//  ObjcHelloWorld
//
//  Created by Benny Davidovitz on 04/05/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import "NSString+emailValidation.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = [[NSArray alloc] initWithObjects:@1,@2, nil];
    Person *p = [[Person alloc] init]; //[Person new];
    [p setFirstName:@"Menahem"];
    p.firstName = @"Mendel";
    
    [p doSomething];
    
    NSString *firstName = [p firstName];
    firstName = p.firstName;
    
    self.person = p;
    
    Person *p2 = [[Person alloc] initWithFirstname:@"Aviv" birthdate:[NSDate new]];
    
    NSDate *birthdate = [p2 valueForKey:@"birthdate"];
}

- (IBAction)buttonPressed:(id)sender {

    NSString *text = _textField.text; //[[self textField] text]; [self.textField text];
    //let str = "Hello \(text) 🤑"
    NSString *str = [NSString stringWithFormat:@"Hello %@ 🤑",text];
    _label.text = str;
    
    BOOL isValidEmail = [text isValidEmail];
    NSString *str2 = isValidEmail ? @"Valid Email" : @"Not valid email";
    NSLog(@"%@",str2);
    
//    id value = @"5";
//    value = @5;
//    
//    NSInteger num = [value integerValue];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end







