#import <Foundation/Foundation.h>
#import "ToBuyItem.h"

@interface CartItem : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic) float price;
@property(nonatomic) int count;

-(NSString*)priceInStringValue;
-(NSString*)countInStringValue;
-(NSString*)returnTotalInStringValue;
-(float)returnTotalInFloatValue;
-(void)setPriceFromStringValue: (NSString*) strPrice;
-(void)setCountFromStringValue: (NSString*) strCount;

@end

@interface CartItem (NSCodingSupport) <NSCoding>

@end
