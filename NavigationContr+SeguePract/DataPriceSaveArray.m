#import "DataPriceSaveArray.h"

static NSString* const kForArchive=@"id-key-for-dataPrice";

static NSString* const kForSession=@"id-key-for-session";

@interface DataPriceSaveArray ()
{
    NSMutableArray<DataPriceSave*>* _dataPriceObjectsArray;
    NSMutableArray<NSArray<CartItem*>*>* _sessionArray;
}

@end

@implementation DataPriceSaveArray

@synthesize dataPriceObjectsArray=_dataPriceObjectsArray;
@synthesize sessionArray=_sessionArray;

-(instancetype)init
{
    self=[super init];
    
    if(self)
    {
        _dataPriceObjectsArray=[NSMutableArray new];
        _sessionArray=[NSMutableArray new];
    }
    
    [self loadData];
    
    return self;
}

-(void)addSaveItem:(DataPriceSave*)item
       withSession:(NSArray<CartItem*>*)session
{
    [self->_dataPriceObjectsArray addObject:item];
    [self->_sessionArray addObject:session];
    [self saveData];
}

-(void)removeSaveItemAtIndex:(NSUInteger)index
{
    [self->_dataPriceObjectsArray removeObjectAtIndex:index];
    [self->_sessionArray removeObjectAtIndex:index];
    [self saveData];
}

-(void)clearUserDefaults
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:kForArchive];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:kForSession];
}

-(NSArray<NSArray<CartItem*>*>*)returnSessionArray
{
    return self.sessionArray;
}

-(void)saveData
{
    NSData* archivedDatePriceData=[NSKeyedArchiver archivedDataWithRootObject:self.dataPriceObjectsArray];
    NSData* archivedSessionData=[NSKeyedArchiver archivedDataWithRootObject:self.sessionArray];
    
    [[NSUserDefaults standardUserDefaults]setObject:archivedDatePriceData
                                             forKey:kForArchive];
    [[NSUserDefaults standardUserDefaults]setObject:archivedSessionData
                                             forKey:kForSession];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)loadData
{
    NSData* unarchiveDatePriceData=[[NSUserDefaults standardUserDefaults] objectForKey:kForArchive];
    NSData* unarchiveSessionData=[[NSUserDefaults standardUserDefaults] objectForKey:kForSession];
    
    if(unarchiveDatePriceData&&unarchiveSessionData)
    {
        NSArray* tempDatePriceArray=[NSKeyedUnarchiver unarchiveObjectWithData:unarchiveDatePriceData];
        NSArray* tempSessionArray=[NSKeyedUnarchiver unarchiveObjectWithData:unarchiveSessionData];
        
        [self->_dataPriceObjectsArray setArray:tempDatePriceArray];
        [self->_sessionArray setArray:tempSessionArray];
    }
}

@end
