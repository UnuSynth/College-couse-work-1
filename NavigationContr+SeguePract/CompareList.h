//
//  CompareList.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 15.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompareItemList.h"

@interface CompareList : NSObject

@property(nonatomic, strong)NSArray<CompareItemList*>* compareList;

-(void)newListWithCompareItem:(CompareItem*)item
                      andName:(NSString*)name;

-(void)addItem:(CompareItem*)item
      withName:(NSString*)name;

-(void)deleteCompareItemAtIndex:(NSUInteger)index
                         andRow:(NSUInteger)row;

-(void)saveData;
-(void)loadData;

@end
