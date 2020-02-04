//
//  CartListTableViewController.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 23.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToBuyList.h"

@class CartListTableViewController;

@interface CartListTableViewController : UITableViewController

-(void)setList:(ToBuyList*)list;

@property (nonatomic, strong) ToBuyList* cartList;

@end
