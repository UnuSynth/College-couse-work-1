//
//  DataPriceSave.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 04.11.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "DataPriceSave.h"

#define SEL_TO_STR(sel) NSStringFromSelector(@selector(sel))

@implementation DataPriceSave

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    
    if(self)
    {
        self.total=[aDecoder decodeFloatForKey:SEL_TO_STR(total)];
        self.date=[aDecoder decodeObjectForKey:SEL_TO_STR(date)];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeFloat:self.total
                 forKey:SEL_TO_STR(total)];
    [aCoder encodeObject:self.date
                  forKey:SEL_TO_STR(date)];
}

@end
