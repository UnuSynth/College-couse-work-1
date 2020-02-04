//
//  CompareItemList.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 15.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import "CompareItemList.h"

#define selToStr(sel) NSStringFromSelector(@selector(sel))

@interface CompareItemList ()
{
    NSMutableArray<CompareItem*>* _compareItemList;
}

@end//CompareItemList interface-extension

@implementation CompareItemList

@synthesize compareItemList=_compareItemList;

-(instancetype)init
{
    self=[super init];
    
    if(self)
    {
        self->_compareItemList=[[NSMutableArray alloc]init];
    }
    
    return self;
}

-(void)addCompareItem:(CompareItem*)item
{
    [self->_compareItemList addObject:item];
}

-(void)removeCompareItemAtIndex:(NSUInteger)index
{
    [self->_compareItemList removeObjectAtIndex:index];
}

//-(void)setItemName:(NSString*)itemName
//{
//    self.itemName=itemName;
//}

-(NSString*)getItemName
{
    return self.itemName;
}

-(instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self=[super init];
    
    if(self)
    {
        self->_compareItemList=[NSMutableArray new];
        [self->_compareItemList setArray:[aDecoder decodeObjectForKey:selToStr(compareItemList)]];
        self.itemName=[aDecoder decodeObjectForKey:selToStr(itemName)];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder*)aCoder
{
    [aCoder encodeObject:self.compareItemList
                  forKey:selToStr(compareItemList)];
    [aCoder encodeObject:self.itemName
                  forKey:selToStr(itemName)];
}

@end
