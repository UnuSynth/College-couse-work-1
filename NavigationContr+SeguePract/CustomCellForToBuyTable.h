//
//  CustomCellForToBuyTable.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 21.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToBuyItem.h"

@interface CustomCellForToBuyTable : UITableViewCell

@property (nonatomic, strong) ToBuyItem* itemForCell;

-(void)setInfoAboutItem: (ToBuyItem*) item;

@end
