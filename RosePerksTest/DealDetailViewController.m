
#import "RHUIImageResizing.h"

#import "DealDetailViewController.h"

//@interface RHDetailViewController ()

@implementation DealDetailViewController
@synthesize theList;
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *compID = [NSString stringWithFormat:@"%ld",(long)theList.CompanyID];
    NSString *strippedImageName = [compID stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *imageName = [NSString stringWithFormat:@"%@%@", strippedImageName, @".jpg"];
    //imageName = [NSHomeDirectory() stringByAppendingPathComponent:imageName];
    //imageName = [NSString stringWithFormat:@"/Users/susanhatcher/Desktop/%@", imageName];
    NSLog(@"%@\n\n\n", imageName);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    imageName = [documentsPath stringByAppendingPathComponent:imageName];
    
    UIImage *pic = [UIImage imageWithContentsOfFile: imageName];
//    UIImage* smallImage = [pic scaleToSize:CGSizeMake(70.0f,50.0f)];
    LogoView.image = pic;
    LogoView.frame = CGRectMake(LogoView.frame.origin.x, LogoView.frame.origin.y,30,30);
//    LogoView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%d%@", theList.CompanyID, @".jpg"]];

    self.title = theList.name;
    LocationField.text = theList.location;
    NumberField.text = theList.number;
    DiscountField.text = theList.discount;
    
    
    LocationField.textAlignment = NSTextAlignmentCenter;
    NumberField.textAlignment =NSTextAlignmentCenter;
    DiscountField.textAlignment = NSTextAlignmentCenter;

    
    
    NSString *coupon =[theList.coupon stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([coupon length] ==0)
    {
        self->CouponBut.hidden = YES;
    }
    NSString *website =[theList.website stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([website length] ==0)
    {
        self->DetailBut.hidden = YES;
    }

}



- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CouponButton:(id)sender {
    NSString *coupon =[theList.coupon stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];


    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:coupon]];
    
}

- (IBAction)MoreDetailButton:(id)sender {
    NSString *website =[theList.website stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

        
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:website]];

}
@end
