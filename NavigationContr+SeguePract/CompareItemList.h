//
//  CompareItemList.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 15.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompareItem.h"

@interface CompareItemList : NSObject

@property(nonatomic, strong)NSString* itemName;
@property(nonatomic, strong)NSArray<CompareItem*>* compareItemList;

-(void)addCompareItem:(CompareItem*)item;
-(void)removeCompareItemAtIndex:(NSUInteger)index;
-(void)setItemName:(NSString*)itemName;
-(NSString*)getItemName;

@end

@interface CompareItemList (NSCodingSupport) <NSCoding>

@end//CompareItemList
