//
//  CustomCellForToBuyTable.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 21.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "CustomCellForToBuyTable.h"

@interface CustomCellForToBuyTable ()

@property (nonatomic, strong) IBOutlet UILabel* nameLabel;
@property (nonatomic, strong) IBOutlet UILabel* dateLabel;
@property (nonatomic, strong) IBOutlet UILabel* timeLabel;
@property (nonatomic, strong) NSDateFormatter* dateFormatter;
@property (nonatomic, strong) NSDateFormatter* timeFormatter;

@end

@implementation CustomCellForToBuyTable

-(void)setInfoAboutItem: (ToBuyItem*) item
{
    self.dateFormatter=[[NSDateFormatter alloc]init];
    self.timeFormatter=[[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"dd'.'MM'.'YY"];
    [self.timeFormatter setDateFormat:@"HH':'mm"];
    
    self.itemForCell=item;
    
    self.nameLabel.text=self.itemForCell.name;
    self.dateLabel.text=[self.dateFormatter stringFromDate:self.itemForCell.date];
    self.timeLabel.text=[self.timeFormatter stringFromDate:self.itemForCell.date];
}

@end
