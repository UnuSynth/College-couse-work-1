//
//  CustomFooterForCartList.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 30.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "CustomFooterForCartList.h"

@interface CustomFooterForCartList ()

@property(nonatomic, strong) IBOutlet UILabel* totalLabel;

@end

@implementation CustomFooterForCartList

+(NSString*)nibName
{
    return NSStringFromClass([self class]);
}

+(NSString*)footerReuseID
{
    return [NSString stringWithFormat:@"%@-reuse-id", NSStringFromClass([self class])];
}

-(void)setTotal:(float)total
{
    self.totalPrice=total;
    self.totalLabel.text=[NSString stringWithFormat:@"All: %.2f$", self.totalPrice];
}

-(void)setText:(NSString*)text
{
    self.totalLabel.text=text;
}

@end
