//
//  DataPriceSave.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 04.11.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataPriceSave : NSObject

@property(nonatomic)float total;
@property(nonatomic, strong)NSDate* date;

@end

@interface DataPriceSave (NSCodingSupport) <NSCoding>

@end
