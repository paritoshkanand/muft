
#import <UIKit/UIKit.h>
#import "RHAppDelegate.h"
#import "List.h"
#import "DealCategory.h"


@class DealDetailViewController;


@interface MasterTableViewController : UITableViewController

@property (strong,nonatomic) DealDetailViewController *detailViewController;
@property (nonatomic,retain) RHAppDelegate *app;
@property (nonatomic,retain) List *theList;
@property (nonatomic,retain) List *allPerksList;
@property (nonatomic,retain) DealCategory *objectivecateg;
@property (nonatomic) NSUInteger counter;
@property (nonatomic) NSUInteger fakeIndexPath;
@property (nonatomic) NSUInteger size;
@property (nonatomic) NSMutableDictionary *indexPathMap;
- (List*)newElement:(NSUInteger)counter;
- (void)populateMap:(NSInteger) size;


@end
