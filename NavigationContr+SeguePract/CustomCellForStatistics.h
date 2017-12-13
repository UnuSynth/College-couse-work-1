//
//  CustomCellForStatistics.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 13.11.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataPriceSave.h"

@interface CustomCellForStatistics : UITableViewCell

@property(nonatomic, strong)IBOutlet UILabel* totalLabel;
@property(nonatomic, strong)IBOutlet UILabel* dateLabel;

-(void)setDataIntoCell:(DataPriceSave*)item
          andIndexPath:(NSIndexPath*)indexPath;

@end
