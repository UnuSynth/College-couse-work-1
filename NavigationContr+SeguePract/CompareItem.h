//
//  CompareItem.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 15.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import "Product.h"

@interface CompareItem : Product

@property(nonatomic, strong)NSString* shopName;

//-(void)setShopName:(NSString*)shopName;

@end

@interface CompareItem (NSCodingSupport) <NSCoding>

@end//CompareItem
