//
//  Products.m
//  Objective_C_Classes
//
//  Created by ayush mahajan on 17/09/16.
//  Copyright © 2016 ayush mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Products.h"

@implementation Products

@synthesize productName, productPrice, productCategory;

- (id)init
{
    self = [super init];
    productName = @"";
    productPrice = @"";
    productCategory = @"";
    return self;
}

@end