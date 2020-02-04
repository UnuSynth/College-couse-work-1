//
//  Product.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 15.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic) float price;

-(NSString*)priceInStringValue;
-(void)setName:(NSString*)name;
-(void)setPriceFromStringValue:(NSString*)strPrice;

@end

@interface Product (NSCodingSupport) <NSCoding>

@end
