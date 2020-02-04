//
//  CustomCellForCartList.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 24.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "CustomCellForCartList.h"

@interface CustomCellForCartList ()

@property(nonatomic, strong)IBOutlet UILabel* nameLabel;
@property(nonatomic, strong)IBOutlet UILabel* priceLabel;
@property(nonatomic, strong)IBOutlet UILabel* countLabel;
@property(nonatomic, strong)IBOutlet UILabel* totalLabel;

@end

@implementation CustomCellForCartList

-(void)setCellData:(CartItem*)item
{
    self->_cartItem=item;
    
    self.nameLabel.text=[NSString stringWithFormat:@"%@", self->_cartItem.name];
    self.priceLabel.text=[NSString stringWithFormat:@"Цена: %@ с", [self->_cartItem priceInStringValue]];
    self.countLabel.text=[NSString stringWithFormat:@"Кол-во: %@", [self->_cartItem countInStringValue]];
    self.totalLabel.text=[NSString stringWithFormat:@"Стоимость: %@ с", [self->_cartItem returnTotalInStringValue]];
}

@end
