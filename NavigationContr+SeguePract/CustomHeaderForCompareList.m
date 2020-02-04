//
//  CustomHeaderForCompareList.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 16.01.18.
//  Copyright © 2018 Amantay. All rights reserved.
//

#import "CustomHeaderForCompareList.h"

@implementation CustomHeaderForCompareList

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
