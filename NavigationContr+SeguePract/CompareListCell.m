//
//  CompareListCell.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 16.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import "CompareListCell.h"

@interface CompareListCell ()

@property(nonatomic, strong)IBOutlet UILabel* nameLabel;
@property(nonatomic, strong)IBOutlet UILabel* priceLabel;
@property(nonatomic, strong)IBOutlet UILabel* shopLabel;

@end


@implementation CompareListCell

-(void)setCompareItemIntoCell:(CompareItem*)item
{
    //self.nameLabel.text=[NSString stringWithFormat:@"Магазин: %@", item.name];
    self.priceLabel.text=[NSString stringWithFormat:@"Цена: %@ с", [item priceInStringValue]];
    self.shopLabel.text=[NSString stringWithFormat:@"%@", item.shopName];
}

@end
