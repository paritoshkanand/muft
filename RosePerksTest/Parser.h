
#import <Foundation/Foundation.h>
#import "RHAppDelegate.h"
#import "List.h"

@interface Parser : NSObject <NSXMLParserDelegate>{
    
    RHAppDelegate *app;
    List *theList;
    NSMutableString *currentElementValue;
    
    
}

-(id)initParser;



@end
