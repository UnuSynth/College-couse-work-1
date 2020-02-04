//
//  Product.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 15.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import "Product.h"

#define selToStr(sel) NSStringFromSelector(@selector(sel))

@implementation Product

-(NSString*)priceInStringValue
{
    NSString* str=[NSString stringWithFormat:@"%.2f", self.price];
    return str;
}

//-(void)setName:(NSString *)name
//{
//    self.name=name;
//}

-(void)setPriceFromStringValue:(NSString*)strPrice
{
    self.price=[strPrice floatValue];
}

@end

@implementation Product (NSCodingSupport)

-(instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self=[super init];
    
    if(self)
    {
        self.name=[aDecoder decodeObjectForKey:selToStr(name)];
        self.price=[aDecoder decodeFloatForKey:selToStr(price)];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder*)aCoder
{
    [aCoder encodeObject:self.name
                  forKey:selToStr(name)];
    [aCoder encodeFloat:self.price
                 forKey:selToStr(price)];
}

@end
