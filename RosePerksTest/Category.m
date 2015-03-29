//
//  RHCategory.m
//  RosePerksTest
//
//  Created by HUANG ZIYANG on 5/4/14.
//  Copyright (c) 2014 Rose-Hulman. All rights reserved.
//

#import "Category.h"
#import "CategoryViewController.h"

@implementation Category
@synthesize currentCategory;

static Category *instance = nil;
+(Category *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance=[Category new];
            instance.currentCategory = @"";
        }
        
    }
    return instance;



}

@end
