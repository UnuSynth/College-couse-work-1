#import <Foundation/Foundation.h>

@interface ToBuyItem : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSDate* date;

@end

@interface ToBuyItem (NSCodingSupport) <NSCoding>

@end
