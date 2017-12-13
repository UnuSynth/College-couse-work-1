//
//  DataPriceSaveArray.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 04.11.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataPriceSave.h"
#import "CartItem.h"

@interface DataPriceSaveArray : NSObject

@property(nonatomic, strong)NSArray<DataPriceSave*>* dataPriceObjectsArray;

@property(nonatomic, strong)NSArray<NSArray<CartItem*>*>* sessionArray;

-(void)addSaveItem:(DataPriceSave*)item
       withSession:(NSArray<CartItem*>*)session;
-(void)removeSaveItemAtIndex:(NSUInteger)index;
-(void)saveData;
-(void)loadData;
-(void)clearUserDefaults;
-(NSArray<NSArray<CartItem*>*>*)returnSessionArray;

@end
