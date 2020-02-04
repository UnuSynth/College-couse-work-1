//
//  CompareList.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 15.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import "CompareList.h"

static NSString* const kForArchiveCompareList=@"id-key-for-compareList";

@interface CompareList ()
{
    NSMutableArray* _compareList;
}
@end

@implementation CompareList

@synthesize compareList=_compareList;

-(instancetype)init
{
    self=[super init];
    
    if(self)
    {
        self->_compareList=[NSMutableArray new];
        [self loadData];
        
        return self;
    }
    
    return nil;
}

-(void)newListWithCompareItem:(CompareItem*)item
                      andName:(NSString*)name
{
    CompareItemList* itemList=[[CompareItemList alloc] init];
    [itemList addCompareItem:item];
    itemList.itemName=name;
    
    [self->_compareList addObject:itemList];
}

-(void)addItem:(CompareItem*)item
      withName:(NSString*)name
{
    if(self.compareList.count==0)
    {
        [self newListWithCompareItem:item
                             andName:name];
    }
    
    else
    {
        for (int i=0; i<self.compareList.count; i++)
        {
            if([[self.compareList[i] getItemName] isEqualToString:name])
            {
                [self->_compareList[i] addCompareItem:item];
                
                break;
            }
            
            if(i==self.compareList.count-1)
            {
                [self newListWithCompareItem:item
                                     andName:name];
                
                break;
            }
        }
    }
}

-(void)deleteCompareItemAtIndex:(NSUInteger)index
                         andRow:(NSUInteger)row
{
    [self.compareList[index] removeCompareItemAtIndex:row];
}

-(void)saveData
{
    NSData* archivedDatePriceData=[NSKeyedArchiver archivedDataWithRootObject:self.compareList];
    
    [[NSUserDefaults standardUserDefaults]setObject:archivedDatePriceData
                                             forKey:kForArchiveCompareList];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)loadData
{
    NSData* unarchiveCompareList=[[NSUserDefaults standardUserDefaults] objectForKey:kForArchiveCompareList];
    
    if(unarchiveCompareList)
    {
        NSArray* tempCompareList=[NSKeyedUnarchiver unarchiveObjectWithData:unarchiveCompareList];
        
        [self->_compareList setArray:tempCompareList];
    }
}

@end
