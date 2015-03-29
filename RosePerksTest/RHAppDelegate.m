
#import "RHAppDelegate.h"
#import "Parser.h"
#import "MasterTableViewController.h"


@implementation RHAppDelegate
@synthesize ListArray;
@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *xmlPath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"perkslist.xml"]];
    // End getting the path to save the XML to

    NSURL *urlXML = [[NSURL alloc]initWithString:@"http://www.designcurry.in/muft/alldeals"];
     NSData *data = [[NSData alloc]initWithContentsOfURL:urlXML];
    if([data length] == 0){
        self.offline = true;
        data = [[NSData alloc] initWithContentsOfFile:xmlPath];
        if([data length] == 0){
            // First run and no internet connection
            UIAlertView* alert;
            alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"The Muft App needs access to internet on its initial boot up to populate the deals list. After this initial population this App will perform without internet." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
    else{
        self.offline = false;
        [data writeToFile:xmlPath atomically:true];
    }
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    
    
//    NSString *path = @"/Users/huangz/Desktop/AlumniPerks-iOS/PerksList.xml";
//    NSString *standardizedPath = [path stringByStandardizingPath];
    // standardizedPath: /usr/include
    
    //NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/Users/susanhatcher/Desktop/PerksList.xml"];
//    NSData *data = [[NSData alloc] initWithContentsOfFile:standardizedPath];
//    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    Parser *theParser = [[Parser alloc] initParser];
    [xmlParser setDelegate:theParser];
    
    BOOL worked = [xmlParser parse];
    if(worked) {
        NSLog(@"Amount %lu",(unsigned long)[ListArray count]);
    }
    else{
        NSLog(@"boo");
    }
    List * temp;
    NSURL *url;
    NSData *data2;
    NSString *midString;
    NSString *numID;
    UIImage *tempImage;
    if(!self.offline){
        for(int i = 0; i < [ListArray count]; i++){
            temp = (List*) ListArray[i];
            NSLog(@"%ld", (long)temp.CompanyID);
            numID =[NSString stringWithFormat:@"%ld%@", (long)temp.CompanyID, @".jpg"];
            midString = [NSString stringWithFormat:@"http://www.designcurry.in/muft/images/%@", numID];
            url = [[NSURL alloc]initWithString:midString];
            data2 = [[NSData alloc]initWithContentsOfURL:url];
            tempImage = [UIImage imageWithData:data2];

            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
            numID = [documentsPath stringByAppendingPathComponent:numID];
            
            //numID = [NSHomeDirectory() stringByAppendingPathComponent:numID];
            //numID = [NSString stringWithFormat:@"/Users/susanhatcher/Desktop/%@", numID];
            [UIImageJPEGRepresentation(tempImage, 1.0) writeToFile:numID atomically:YES];
            //[data2 writeToFile:@"numID" atomically:true];
        }
    }
    
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSLog(@"one");
    //RHMasterTableViewController *masterViewController = [[RHMasterTableViewController alloc] initWithNibName:@"RHMasterTableViewController" bundle:nil];
    
   // UIStoryboard*  sb = [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"Main.storyboard"] bundle:[NSBundle mainBundle]];
                                                  
   // RHMasterTableViewController* masterViewController = [sb instantiateViewControllerWithIdentifier                                                    :@"RHMasterTableViewController"];
    
    NSLog(@"two");
    //self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    NSLog(@"three");
    //self.window.rootViewController = self.navigationController;
    NSLog(@"four");
    //[self.window makeKeyAndVisible];
    NSLog(@"five");
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
