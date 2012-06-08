//
//  PareserDemoViewController.h
//  PareserDemo
//
//  Created by hummy on 5/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"

@interface PareserDemoViewController : UIViewController<NSXMLParserDelegate> {
    
    NSString		*current;
	NSMutableString	*outstring;
    NSMutableArray *categories;
}
- (NSString *)parseXMLFile: (NSURL *) url;
@end