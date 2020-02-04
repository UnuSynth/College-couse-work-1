#import "ToBuyItem.h"

#define selToStr(sel) NSStringFromSelector(@selector(sel))

@implementation ToBuyItem

//-(void)setName:(NSString *)name
//{
//    self.name=name;
//}

//-(void)setDate:(NSDate *)date
//{
//    self.date=date;
//}

@end

@implementation ToBuyItem (NSCodingSupport)

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    
    if(self)
    {
        self.name=[aDecoder decodeObjectForKey:selToStr(name)];
        self.date=[aDecoder decodeObjectForKey:selToStr(date)];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name
                  forKey:selToStr(name)];
    [aCoder encodeObject:self.date
                  forKey:selToStr(date)];
}

@end
