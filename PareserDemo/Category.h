//
//  Category.h
//  PareserDemo
//
//  Created by hummy on 5/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Category : NSObject {
    
    NSString *code,*name,*path;
}

@property (nonatomic, retain)  NSString *code,*name,*path;

@end
