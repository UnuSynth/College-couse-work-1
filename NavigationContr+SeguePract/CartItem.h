#import <Foundation/Foundation.h>
#import "ToBuyItem.h"
#import "Product.h"

@interface CartItem : Product

@property(nonatomic) int count;

-(NSString*)countInStringValue;
-(NSString*)returnTotalInStringValue;
-(float)returnTotalInFloatValue;
-(void)setCountFromStringValue: (NSString*) strCount;

@end

@interface CartItem (NSCodingSupport) <NSCoding>

@end
