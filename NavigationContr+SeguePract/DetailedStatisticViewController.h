//
//  DetailedStatisticViewController.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 13.11.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartItem.h"

@interface DetailedStatisticViewController : UITableViewController

@property(nonatomic)NSUInteger index;
@property(nonatomic, strong)NSArray<NSArray<CartItem*>*>* clonedSessionArray;
//@property(nonatomic, strong)IBOutlet UINavigationItem* titleText;

//-(void)setClonedSessionArray:(NSArray<NSArray<CartItem*>*>*)clonedSessionArray;

-(void)customMethodSetClonedSessionArray:(NSArray<NSArray<CartItem*>*>*)clonedArray;

@end
