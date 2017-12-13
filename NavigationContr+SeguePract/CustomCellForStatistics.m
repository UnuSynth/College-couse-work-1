//
//  CustomCellForStatistics.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 13.11.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "CustomCellForStatistics.h"
#import "DataPriceSave.h"

@interface CustomCellForStatistics ()

//@property(nonatomic, strong)IBOutlet UILabel* totalLabel;
//@property(nonatomic, strong)IBOutlet UILabel* dateLabel;
@property(nonatomic, strong)NSDateFormatter* dateFormatter;
@property(nonatomic) NSUInteger index;

@end

@implementation CustomCellForStatistics

-(void)setDataIntoCell:(DataPriceSave*)item
          andIndexPath:(NSIndexPath*)indexPath
{
    self.dateFormatter=[[NSDateFormatter alloc]init];
    
    [self.dateFormatter setDateFormat:@"dd'.'MM'.'YY' 'HH':'mm"];
    
    self.dateLabel.text=[NSString stringWithFormat:@"%@",[self.dateFormatter stringFromDate:item.date]];
    self.totalLabel.text=[NSString stringWithFormat:@"You spent %.2f$", item.total];
    
    self.index=indexPath.row;
}

@end
