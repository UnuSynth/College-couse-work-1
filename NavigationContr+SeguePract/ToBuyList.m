#import "ToBuyList.h"

static NSString* const archivedDataID=@"archive-data-id";

@interface ToBuyList ()
{
    NSMutableArray<ToBuyItem*>* _toBuyItemList;
    NSMutableArray<CartItem*>* _cartItemList;
}
@end

@implementation ToBuyList

@synthesize toBuyItemList=_toBuyItemList;
@synthesize cartItemList=_cartItemList;

-(instancetype) init
{
    self=[super init];
    
    if(self)
    {
        self->_toBuyItemList=[NSMutableArray new];
        self->_cartItemList=[NSMutableArray new];
    }
    
    [self loadData];
    
    return self;
}

-(void) initArray
{
    ToBuyItem* item=[ToBuyItem new];
    item.name=@"InitName";
    
    [self->_toBuyItemList addObject:item];
}

-(void) addToBuyItem: (ToBuyItem*) item
{
    [self->_toBuyItemList addObject:item];
}

-(void) addCartItem: (CartItem*) item
{
    [self->_cartItemList addObject:item];
}

-(void) removeToBuyItemAtIndex:(NSUInteger) index
{
    [self->_toBuyItemList removeObjectAtIndex:index];
}

-(void) removeCartItemAtIndex:(NSUInteger) index
{
    [self->_cartItemList removeObjectAtIndex:index];
}

-(void) clearCartList
{
    [self->_cartItemList removeAllObjects];
    [self saveData];
}

-(void) saveData
{
    NSData* toBuyArchiveData=[NSKeyedArchiver archivedDataWithRootObject:self->_toBuyItemList];
    
    [[NSUserDefaults standardUserDefaults]setObject: toBuyArchiveData
                                              forKey:archivedDataID];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void) loadData
{
    NSData* toBuyUnarchiveData=[[NSUserDefaults standardUserDefaults]objectForKey:archivedDataID];
    
    if(toBuyUnarchiveData)
    {
        NSArray* tempArr=[NSKeyedUnarchiver unarchiveObjectWithData:toBuyUnarchiveData];
        [self->_toBuyItemList setArray:tempArr];
    }
}

-(float)cartListCountTotalPrice
{
    float temp=0;
    
    for (CartItem* tempItem in self.cartItemList)
    {
        temp+=[tempItem returnTotalInFloatValue];
    }
    
    return temp;
}

@end
