//
//  CustomHeaderForToBuyList.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 23.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "CustomHeaderForToBuyList.h"

@interface CustomHeaderForToBuyList ()

@end

@implementation CustomHeaderForToBuyList

+(NSString*)nibName
{
    return NSStringFromClass([self class]);
}

+(NSString*)headerReuseID
{
    return [NSString stringWithFormat:@"%@-reuse-id", NSStringFromClass([self class])];
}


-(void)awakeFromNib
{
    
    [super awakeFromNib];
    
    self.backgroundView.backgroundColor=[UIColor blackColor];
}

@end
