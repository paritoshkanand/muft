#import "CategoryViewController.h"
#import "DealCategory.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)HotelButton:(UIButton *)sender {
    DealCategory *Hotelobj = [DealCategory getInstance];
    Hotelobj.currentCategory = @"hotel";
    
}

- (IBAction)FoodButton:(id)sender {
    DealCategory *Foodobj = [DealCategory getInstance];
    Foodobj.currentCategory = @"restaurant";
}

- (IBAction)StoreButton:(id)sender {
    DealCategory *Storeobj = [DealCategory getInstance];
    Storeobj.currentCategory = @"store";
}

- (IBAction)BankingButton:(id)sender {
    DealCategory *Bankingobj = [DealCategory getInstance];
    Bankingobj.currentCategory = @"car";
}

- (IBAction)OtherButton:(id)sender {
    DealCategory *Otherobj = [DealCategory getInstance];
    Otherobj.currentCategory = @"other";
}
@end
