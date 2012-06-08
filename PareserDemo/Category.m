//
//  Category.m
//  PareserDemo
//
//  Created by hummy on 5/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Category.h"


@implementation Category
@synthesize  code,name,path;

- (void)dealloc{
    
    [self setCode:nil];
    [self setName:nil];
    [self setPath:nil];
    [super dealloc];
}

@end
