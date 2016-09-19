//
//  ViewController.m
//  Objective_C_Classes
//
//  Created by ayush mahajan on 17/09/16.
//  Copyright © 2016 ayush mahajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
 IBOutlet UITextField *textFieldProductName;
 IBOutlet UITextField *textFieldProductPrice;
 IBOutlet UITextField *textFieldProductCategory;
 NSMutableArray *arrayProducts;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayProducts = [[NSMutableArray alloc]init];
}

-(BOOL) isValid:(NSString*)isValidString
{
  if([isValidString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
  {
      return NO;
  }
    else
        return YES;
}

/** This function checks for validations whether the user has added only whitespaces in the text field
  * \returns Returns YES if the names and prices are added correctly else returns NO
 */
- (void)checkValidation
{
    if([self isValid:textFieldProductName.text] == NO)
    {
        [textFieldProductName becomeFirstResponder];
    }
    else if([self isValid:textFieldProductPrice.text]== NO)
    {
        [textFieldProductPrice becomeFirstResponder];
    }
    else if ([self isValid:textFieldProductCategory.text] == NO)
    {
        [textFieldProductCategory becomeFirstResponder];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Product Added" delegate:self
                                                 cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
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
    [self checkValidation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
