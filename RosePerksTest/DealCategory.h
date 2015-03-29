
#import <Foundation/Foundation.h>

@interface DealCategory : NSObject {
    NSString *currentCategory;
}

@property(nonatomic,retain)NSString *currentCategory;
+(DealCategory*)getInstance;

@end


