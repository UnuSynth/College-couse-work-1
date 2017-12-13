//
//  ToBuyList.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 21.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToBuyItem.h"
#import "CartItem.h"

@interface ToBuyList : NSObject

@property(nonatomic, strong) NSArray<ToBuyItem*>* toBuyItemList;
@property(nonatomic, strong) NSArray<CartItem*>* cartItemList;

-(void) initArray;
-(void) addToBuyItem: (ToBuyItem*) item;
-(void) addCartItem: (CartItem*) item;
-(void) removeToBuyItemAtIndex:(NSUInteger) index;
-(void) removeCartItemAtIndex:(NSUInteger) index;
-(void) clearCartList;
-(void) saveData;
-(void) loadData;
-(float) cartListCountTotalPrice;

@end
