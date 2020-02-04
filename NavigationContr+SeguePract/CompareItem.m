//
//  CompareItem.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 15.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import "CompareItem.h"

#define selToStr(sel) NSStringFromSelector(@selector(sel))

@implementation CompareItem

//-(void)setShopName:(NSString*)shopName
//{
//    self.shopName=shopName;
//}

@end//CompareItem implementation

@implementation CompareItem (NSCodingSupport)

-(instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self=[super init];
    
    if(self)
    {
        self.name=[aDecoder decodeObjectForKey:selToStr(name)];
        self.price=[aDecoder decodeFloatForKey:selToStr(price)];
        self.shopName=[aDecoder decodeObjectForKey:selToStr(shopName)];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder*)aCoder
{
    [aCoder encodeObject:self.name
                  forKey:selToStr(name)];
    [aCoder encodeFloat:self.price
                 forKey:selToStr(price)];
    [aCoder encodeObject:self.shopName
                  forKey:selToStr(shopName)];
}

@end//CompareItem category implementation
