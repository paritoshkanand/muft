

#import "DealCategory.h"
#import "CategoryViewController.h"

@implementation DealCategory
@synthesize currentCategory;

static DealCategory *instance = nil;
+(DealCategory *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance=[DealCategory new];
            instance.currentCategory = @"";
        }
        
    }
    return instance;



}

@end
