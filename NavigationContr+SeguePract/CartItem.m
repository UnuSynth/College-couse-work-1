#import "CartItem.h"

#define selToStr(sel) NSStringFromSelector(@selector(sel))

@implementation CartItem


-(NSString*)countInStringValue
{
    NSString* str=[NSString stringWithFormat:@"%d", self.count];
    return str;
}

-(NSString*)returnTotalInStringValue
{
    NSString* str=[NSString stringWithFormat:@"%.2f", self.count*self.price];
    
    return str;
}

-(float)returnTotalInFloatValue
{
    float temp=self.count*self.price;
    
    return temp;
}

-(void)setCountFromStringValue: (NSString*) strCount
{
    self.count=[strCount intValue];
}

@end

@implementation CartItem (NSCodingSupport)

-(instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self=[super init];
    
    if(self)
    {
        self.name=[aDecoder decodeObjectForKey:selToStr(name)];
        self.price=[aDecoder decodeFloatForKey:selToStr(price)];
        self.count=[aDecoder decodeIntForKey:selToStr(count)];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder*)aCoder
{
    [aCoder encodeObject:self.name
                  forKey:selToStr(name)];
    [aCoder encodeFloat:self.price
                 forKey:selToStr(price)];
    [aCoder encodeInt:self.count
               forKey:selToStr(count)];
}

@end
