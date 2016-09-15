//
//  ViewController.m
//  ObjectiveC_UI_Components
//
//  Created by webonise on 15/09/16.
//  Copyright © 2016 webonise. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textFieldProductName, textFieldProductPrice, textFieldProductCategory;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)checkValidations {
    NSString *pName = textFieldProductName.text;
    NSString *pPrice = textFieldProductPrice.text;
    NSString *pCategory = textFieldProductCategory.text;
    
    if([pName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0)
    {
        [textFieldProductName becomeFirstResponder];
        return NO;
        
    }
    
    else if([pPrice stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0)
    {
        [textFieldProductPrice becomeFirstResponder];
        return NO;
    }
    
    else if([pCategory stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0)
    {
        [textFieldProductCategory becomeFirstResponder];
        return NO;
    }
    
    else
        return YES;
}



- (BOOL)validateProductPrice:(NSString*)number
{
    NSString *productPrice = @"[0-9]{4}";
    NSPredicate *priceTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", productPrice];
    if ([priceTest evaluateWithObject:number] == YES)
        return YES;
    else{
        [textFieldProductPrice becomeFirstResponder];
        return NO;
    }
}


- (BOOL)productNameValidate:(NSString*)nameOfProduct
{
    NSString *name = @"[a-zA-z]+([ '-][a-zA-Z]+)*$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", name];
    if ([nameTest evaluateWithObject:nameOfProduct] == YES)
        return YES;
    else{
        [textFieldProductName becomeFirstResponder];
        return NO;
    }
}


-(IBAction)buttonAddPressed:(id)sender {
    BOOL afterChecking = [self checkValidations];
    BOOL checkPrice = [self validateProductPrice: textFieldProductPrice.text];
    BOOL checkProductName = [self productNameValidate:textFieldProductName.text];
    if(afterChecking == YES && checkPrice == YES && checkProductName== YES)
    {
       UIAlertView *alertPopUP = [[UIAlertView alloc] initWithTitle:@"AddAlert" message:@"Product Added" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
       [alertPopUP show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
