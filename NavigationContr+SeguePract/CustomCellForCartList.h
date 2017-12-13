//
//  CustomCellForCartList.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 24.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartItem.h"

@interface CustomCellForCartList : UITableViewCell

@property(nonatomic, strong)CartItem* cartItem;

-(void)setCellData:(CartItem*) item;

@end
