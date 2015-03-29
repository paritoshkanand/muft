//
//  RHCategory.h
//  RosePerksTest
//
//  Created by HUANG ZIYANG on 5/4/14.
//  Copyright (c) 2014 Rose-Hulman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DealCategory : NSObject {
    NSString *currentCategory;
}

@property(nonatomic,retain)NSString *currentCategory;
+(DealCategory*)getInstance;

@end
