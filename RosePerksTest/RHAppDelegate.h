
#import <UIKit/UIKit.h>
#import "List.h"

@interface RHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *ListArray;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (nonatomic) Boolean offline;
@end
