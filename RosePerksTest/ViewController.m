
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)GoogleMapButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://mapsengine.google.com/map/u/0/edit?mid=zRBarr6eawLk.kMs2XUUHErnM"]];
    
}

- (IBAction)PerksListButton:(id)sender {
    DealCategory *obj = [DealCategory getInstance];
    obj.currentCategory = @"";
    
}
@end
