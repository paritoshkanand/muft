
#import "MasterTableViewController.h"

#import "DealDetailViewController.h"
#import "RHUIImageResizing.h"

#define kNoteDetailSeque @"NoteDetailSeque"


@interface MasterTableViewController ()

@end

@implementation MasterTableViewController
@synthesize app;
@synthesize detailViewController = _detailViewController;
@synthesize theList;

/*- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)viewDidLoad
{
    NSLog(@"Viewdidload");
    [super viewDidLoad];
    app = [[UIApplication sharedApplication] delegate];
    self.allPerksList = theList;
    [self.tableView reloadData];
}

-(void)viewDidUnload
{
    [super viewDidUnload];
}


-(void)viewWillAppear:(BOOL)animated
{
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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.indexPathMap = [NSMutableDictionary dictionary];
    // Return the number of rows in the section.
    self.objectivecateg = [DealCategory getInstance];
    self.counter = 0;
    self.fakeIndexPath = 0;
    int n = 0;
    List *currElement;
    for(int i=0; i<[app.ListArray count]; i++){
        currElement =[app.ListArray objectAtIndex:i];
        NSString *thisPerksCategory =[currElement.category stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if(![self.objectivecateg.currentCategory isEqualToString:@""]){
            if([thisPerksCategory isEqualToString:self.objectivecateg.currentCategory]){
                n++;
            }
        }
        else{
            n = (int)[app.ListArray count];
            break;
        }
        
    }
    self.size = n;
    [self populateMap: n];
    return n;
}

-(void)populateMap:(NSInteger) size{
    for(self.fakeIndexPath = 0; self.fakeIndexPath < self.size; self.fakeIndexPath++){
        DealCategory *currCat = [DealCategory getInstance];
        theList = [app.ListArray objectAtIndex:self.counter];
        NSString *thisPerksCategory =[theList.category stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if(![currCat.currentCategory isEqualToString:@""]){
            while(![thisPerksCategory isEqualToString:currCat.currentCategory]){
                self.counter++;
                if(self.counter < [app.ListArray count]){
                    theList = [self newElement:self.counter];
                    thisPerksCategory =[theList.category stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                }
                else{
                    NSLog(@"Error");
                }
            }
        }
    
        
        if(self.counter < [app.ListArray count]){
            NSString *one =[ NSString stringWithFormat:@"%lu", (unsigned long)self.counter];
            NSString *two = [NSString stringWithFormat:@"%lu", (unsigned long)self.fakeIndexPath];
            self.indexPathMap[two] = one;
        }
        else{
            NSLog(@"Error");
        }
        self.counter++;
    }
}

- (List*)newElement:(NSUInteger)counter{
   // if(counter < [app.ListArray count]){
        List* wtf =[app.ListArray objectAtIndex:counter];
        NSString *companyName =[wtf.name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSLog(@"Grabbing new element: %lu, the business: %@", (unsigned long)counter, companyName);
        return wtf;
    //}
    //return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //self.counter = (NSUInteger) indexPath.row;
    //NSLog(@"Starting over again counter: %d", self.counter);
    //NSLog(@"Starting over again indexPath: %d", indexPath.row);
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }/*
    //theList= self.allPerksList;
    RHCategory *currCat = [RHCategory getInstance];
    if(self.counter < [app.ListArray count]){
        //bug fix
        if([currCat.currentCategory isEqualToString:@""]){
            self.counter = indexPath.row;
        }
            theList = [app.ListArray objectAtIndex:self.counter];
    }
    else{
        NSString *key = [NSString stringWithFormat:@"%d", indexPath.row];
        NSString *value = self.indexPathMap[key];
        NSInteger numberValue = [value integerValue];
        NSLog(@"\nINTERCEPTION: %d\n", numberValue);
        theList = [app.ListArray objectAtIndex:numberValue];
    }
    NSString *thisPerksCategory =[theList.category stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(![currCat.currentCategory isEqualToString:@""]){
        while(![thisPerksCategory isEqualToString:currCat.currentCategory]){
            self.counter++;
            if(self.counter < [app.ListArray count]){
                theList = [self newElement:self.counter];
                thisPerksCategory =[theList.category stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            }
            else{
                NSString *key = [NSString stringWithFormat:@"%d", indexPath.row];
                NSString *value = self.indexPathMap[key];
                NSInteger numberValue = [value integerValue];
                NSLog(@"\nINTERCEPTION: %d\n", numberValue);
                theList = [app.ListArray objectAtIndex:numberValue];
                break;
            }
        }
    }
    if(self.counter < [app.ListArray count]){
        NSString *one =[ NSString stringWithFormat:@"%d", self.counter];
        NSString *two = [NSString stringWithFormat:@"%d", indexPath.row];
        //[self.indexPathMap setObject:one forKey:two];
        NSString *curr = [self.indexPathMap objectForKey:two];
        NSLog(@"%@\n", curr);
        if([curr length] == 0){
            self.indexPathMap[two] = one;
        }*/
        /*else{
            NSString *key = [NSString stringWithFormat:@"%d", indexPath.row];
            NSString *value = self.indexPathMap[key];
            NSInteger numberValue = [value integerValue];
            NSLog(@"\nINTERCEPTION: %d\n", numberValue);
            theList = [app.ListArray objectAtIndex:numberValue];
        }*/
    //}
    //NSString *finalText = [[theList.name componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                          //componentsJoinedByString:@""];
    
    
    /*UIFont *arialFont = [UIFont fontWithName:@"arial" size:18.0];
     NSDictionary *arialDict = [NSDictionary dictionaryWithObject: arialFont forKey:NSFontAttributeName];        NSAttributedString *fontsDisplay = [[NSMutableAttributedString alloc] initWithString:@"" attributes: arialDict];  */
    
    
    NSString *key = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    NSString *value = self.indexPathMap[key];
    NSInteger numberValue = [value integerValue];
    NSLog(@"\nINTERCEPTION: %ld\n", (long)numberValue);
    theList = [app.ListArray objectAtIndex:numberValue];
    
    
    NSString *companyName =[theList.name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *location =[theList.location stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *phone =[theList.number stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *discount =[theList.discount stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *display =[NSString stringWithFormat:@"%@%@%@%@%@%@", @"\n", location, @"\n", phone, @"\n", discount];
    
    
    
    UIFont *arialFont = [UIFont fontWithName:@"Arial-BoldMT" size:12.0];
    NSDictionary *arialDict = [NSDictionary dictionaryWithObject: arialFont forKey:NSFontAttributeName];
    NSMutableAttributedString *aAttrString = [[NSMutableAttributedString alloc] initWithString:companyName attributes: arialDict];
    
    UIFont *VerdanaFont = [UIFont fontWithName:@"verdana" size:6.0];
    NSDictionary *verdanaDict = [NSDictionary dictionaryWithObject:VerdanaFont forKey:NSFontAttributeName];
    NSMutableAttributedString *vAttrString = [[NSMutableAttributedString alloc]initWithString: display attributes:verdanaDict];
    [vAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:(NSMakeRange(0, 5))];
    
    [aAttrString appendAttributedString:vAttrString];
    
    
    
    //cell.textLabel.text = @"hi";
    cell.textLabel.attributedText = aAttrString;
    //cell.textLabel.font = [UIFont systemFontOfSize:6];
    cell.textLabel.numberOfLines = 7;
    NSString *compID = [NSString stringWithFormat:@"%ld",(long)theList.CompanyID];
    NSString *strippedImageName = [compID stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *imageName = [NSString stringWithFormat:@"%@%@", strippedImageName, @".jpg"];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    imageName = [documentsPath stringByAppendingPathComponent:imageName];
    
    //imageName = [NSHomeDirectory() stringByAppendingPathComponent:imageName];
    //imageName = [NSString stringWithFormat:@"/Users/susanhatcher/Desktop/%@", imageName];
    NSLog(@"%@\n\n\n", imageName);
    UIImage *pic = [UIImage imageWithContentsOfFile: imageName];
    UIImage* smallImage = [pic scaleToSize:CGSizeMake(70.0f,50.0f)];
    cell.imageView.image = smallImage;
    cell.imageView.frame = CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y,50,50);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.counter++;
    return cell;
}

//Change the Height of the Cell [Default is 44]:
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 60;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DealDetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
    NSString *key = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    NSString *value = self.indexPathMap[key];
    NSInteger numberValue = [value integerValue];
    theList = [app.ListArray objectAtIndex:numberValue];
    detailView.theList = theList;


    [self.navigationController pushViewController:detailView animated:YES];

}


@end
