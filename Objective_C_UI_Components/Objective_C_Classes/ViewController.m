//
//  ViewController.m
//  Objective_C_Classes
//
//  Created by ayush mahajan on 17/09/16.
//  Copyright © 2016 ayush mahajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textFieldProductName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldProductPrice;
@property (strong, nonatomic) IBOutlet UITextField *textFieldProductCategory;
@property NSMutableArray *arrayProducts;
@end

@implementation ViewController

@synthesize textFieldProductName, textFieldProductPrice, textFieldProductCategory, arrayProducts;

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayProducts = [[NSMutableArray alloc]init];
}

/** This function checks for validations whether the user has added only whitespaces in the text field
  * \returns Returns YES if the names and prices are added correctly else returns NO
 */
- (BOOL)checkValidation
{
    NSString *pname = textFieldProductName.text;
    NSString *pprice = textFieldProductPrice.text;
    NSString *pcategory = textFieldProductCategory.text;
    
    if([pname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0)
    {
        [textFieldProductName becomeFirstResponder];
        return NO;
    }
    
    else if([pprice stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0)
    {
        [textFieldProductPrice becomeFirstResponder];
        return NO;
    }
    
    else if([pcategory stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0)
    {
        [textFieldProductCategory becomeFirstResponder];
        return NO;
    }
    
    else
    {
        return YES;
    }
}

/** Function clears all the three text fields upon calling
  * \returns Returns nothing
 */
-(void) clearTextFields{
    textFieldProductName.text= @"";
    textFieldProductPrice.text = @"";
    textFieldProductCategory.text = @"";
}


-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
        if (buttonIndex == 0)
          {
            Products *objectProducts = [[Products alloc]init];
            [objectProducts setProductName:textFieldProductName.text];
            [objectProducts setProductPrice:textFieldProductPrice.text];
            [objectProducts setProductCategory:textFieldProductCategory.text];
            [arrayProducts addObject:objectProducts];
              for(objectProducts in arrayProducts)
              {
                  NSLog(@"Product Name is:%@",objectProducts.productName);
                  NSLog(@"Product Price is:%@",objectProducts.productPrice);
                  NSLog(@"Product Category is:%@",objectProducts.productCategory);
              }
              [self clearTextFields];
              [textFieldProductName becomeFirstResponder];
          }
    
        else
            return;
}

/** It performs action when ADD button is pressed. Calls checkValidation method and UIAlertView
  * \param sender ID of ADD button
 */

- (IBAction)buttonAddPressed:(id)sender
{
    BOOL isValid = [self checkValidation];
    if(isValid == YES)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Product Added" delegate:self
                                                 cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
