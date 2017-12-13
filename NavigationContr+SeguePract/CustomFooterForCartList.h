//
//  CustomFooterForCartList.h
//  NavigationContr+SeguePract
//
//  Created by Amantay on 30.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartListTableViewController.h"

@interface CustomFooterForCartList : UITableViewHeaderFooterView

@property(nonatomic)float totalPrice;

+(NSString*)nibName;
+(NSString*)footerReuseID;
-(void)setTotal:(float)totalPrice;
-(void)setText:(NSString*)text;


@end
