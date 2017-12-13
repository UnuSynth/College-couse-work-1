//
//  CustomCVCellForStatistics.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 04.11.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "CustomCVCellForStatistics.h"

@interface CustomCVCellForStatistics ()

@property(nonatomic, strong)IBOutlet UILabel* totalLabel;
@property(nonatomic, strong)IBOutlet UILabel* dateLabel;
@property(nonatomic, strong)NSDateFormatter* dateFormatter;

@end

@implementation CustomCVCellForStatistics

-(void)setDataIntoCell:(DataPriceSave*)item
{
    self.dateFormatter=[[NSDateFormatter alloc]init];
    
    [self.dateFormatter dateFromString:@"dd'.'MM'.'YY'@'HH':'mm"];
    
    self.dateLabel.text=[NSString stringWithFormat:@"On %@",[self.dateFormatter stringFromDate:item.date]];
    self.totalLabel.text=[NSString stringWithFormat:@"%.2f$ you spent", item.total];
}

@end
