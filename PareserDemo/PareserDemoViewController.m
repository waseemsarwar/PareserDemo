//
//  PareserDemoViewController.m
//  PareserDemo
//
//  Created by hummy on 5/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PareserDemoViewController.h"

@implementation PareserDemoViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    categories = [[[NSMutableArray alloc]init]autorelease];
    NSURL *url = [NSURL URLWithString:@"http://www.terrafin.com/sstview/TerrafinConf/TerrafinConfig.xml"];
    [self parseXMLFile:url];

}

- (void)viewDidUnload
{
   [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)showCategories{
    
    UITextView *txtView = [[[UITextView alloc]initWithFrame:CGRectMake(10, 10, 300, 400)]autorelease];
    NSString *catStr = @"";
    for(Category *cat in categories){
        catStr = [NSString stringWithFormat:@"%@ Code:  %@ Name:  %@ Path:  %@\n\n",catStr,cat.code,cat.name,cat.path];
    }
    
    txtView.text = catStr;
    [self.view addSubview:txtView];
}

#pragma mark
#pragma mark NSXMParserDelegates

- (NSString *)parseXMLFile: (NSURL *) url
{	
	outstring = [[NSMutableString alloc] init];
	
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL: url];
    
    [parser setDelegate: self];
	[parser parse];
    [parser release];
	
	return [outstring autorelease];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict   
{
    if (qName)
        elementName = qName;
	if (elementName) {
        current = [NSString stringWithString:elementName];
        if ([elementName isEqualToString:@"Category"]) {
            NSLog(@"attributeDict %@",attributeDict);
            Category *cat = [[Category alloc]init];
            cat.code = [attributeDict objectForKey:@"Code"];
            cat.name = [attributeDict objectForKey:@"Name"];
            cat.path = [attributeDict objectForKey:@"Path"];
            [categories addObject:cat];
            [cat release];cat = nil;
        }
        
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	current = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (!current)
        return;
	if ([current isEqualToString:@"Category"]) {
		[outstring appendFormat:@"%@\n", string];
       
    }
}

-(void) parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"parserDidStartDocument"); 	
}

-(void) parserDidEndDocument: (NSXMLParser *)parser {
	 NSLog(@"parserDidEndDocument "); 
    [self showCategories];
}



@end
