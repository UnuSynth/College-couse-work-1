#import "CartListTableViewController.h"
#import "CustomCellForCartList.h"
#import "CustomFooterForCartList.h"
#import "DataPriceSaveArray.h"

static NSString* const cartCellReuseID=@"cart-cell-reuse-identifier";
static NSString* const emptyCartCellReuseID=@"empty-cart-cell-reuse-identifier";
static NSString* const cartFooterReuseID=@"cart-footer-reuse-identifier";

@interface CartListTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)DataPriceSaveArray* saveArr;
@property(nonatomic)float totalPrice;

@property(nonatomic, strong)NSArray<UITableViewRowAction*>* rowActions;

@end

@implementation CartListTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.totalPrice=[self.cartList cartListCountTotalPrice];
    
    self.saveArr=[[DataPriceSaveArray alloc]init];
    
    UINib* footerNib=[UINib nibWithNibName:[CustomFooterForCartList nibName]
                                    bundle:[NSBundle mainBundle]];
    
    [self.tableView     registerNib:footerNib
 forHeaderFooterViewReuseIdentifier:[CustomFooterForCartList footerReuseID]];
    
    UITableViewRowAction* deleteAction=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
                                                                          title:@"Delete"
                                                                        handler:^(UITableViewRowAction* action, NSIndexPath* indexPath)
                                        {
                                            [self.cartList removeCartItemAtIndex:indexPath.row];
                                            
                                            [self.cartList saveData];
                                            
                                            [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                                                                  withRowAnimation:UITableViewRowAnimationLeft];
                                            
                                            [self.tableView reloadData];
                                        }];
    
    self.rowActions=@[deleteAction];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setList:(ToBuyList*)list
{
    self.cartList=[[ToBuyList alloc]init];
    self.cartList=list;
}

-(IBAction)buyButtonTap:(UIButton*)sender
{
    if(self.cartList.cartItemList.count>0)
    {
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"Cart"
                                                                     message:@"You are going to buy products. Are you sure?"
                                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction=[UIAlertAction actionWithTitle:@"Yes"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction* action)
                                 {
                                     DataPriceSave* item=[[DataPriceSave alloc]init];
                                     
                                     item.total=self.totalPrice;
                                     item.date=[NSDate date];
                                     [self.saveArr addSaveItem:item
                                                   withSession:self.cartList.cartItemList];
                                     
                                     [self.cartList clearCartList];
                                     
                                     UIAlertController* successAlert=[UIAlertController alertControllerWithTitle:@"Successful!"
                                                                                                         message:@"Your products have been bought!"
                                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                                     
                                     UIAlertAction* okAction=[UIAlertAction actionWithTitle:@"OK"
                                                                                      style:UIAlertActionStyleDefault
                                                                                    handler:nil];
                                     [successAlert addAction:okAction];
                                     
                                     [self presentViewController:successAlert
                                                        animated:YES
                                                      completion:nil];
                                     
                                     [self.cartList clearCartList];
                                     
                                     [self.tableView reloadData];
                                     
                                     sender.enabled=NO;
                                 }];
        
        UIAlertAction* cancelAction=[UIAlertAction actionWithTitle:@"Cancel"
                                                             style:UIAlertActionStyleCancel
                                                           handler:nil];
        
        [alert addAction:okAction];
        [alert addAction:cancelAction];
        
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
    }
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    if(self.cartList.cartItemList.count==0)
    {
        return 0;
    }
    
    return self.cartList.cartItemList.count;
}

-(UITableViewCell*)tableView:(UITableView*)tableView
       cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    CartItem* item=[CartItem new];
    
    CustomCellForCartList* cell=[self.tableView dequeueReusableCellWithIdentifier:cartCellReuseID];
    
    if(!cell)
    {
        cell=[[CustomCellForCartList alloc]initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:cartCellReuseID];
    }
    
    item=self.cartList.cartItemList[indexPath.row];
    
    [cell setCellData:item];
    
    return cell;
}

-(UIView*)      tableView:(UITableView *)tableView
   viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)     tableView:(UITableView *)tableView
 heightForFooterInSection:(NSInteger)section
{
    return 70;
}

-(UIView*)     tableView:(UITableView*)tableView
  viewForFooterInSection:(NSInteger)section
{
    CustomFooterForCartList* footer=[self.tableView dequeueReusableHeaderFooterViewWithIdentifier:[CustomFooterForCartList footerReuseID]];
    
    if(self.cartList.cartItemList.count>0)
    {
        [footer setTotal:self.totalPrice];
    }
    
    else
    {
        [footer setText:@"Nothing to buy!"];
    }
    
    UINib* footerNib=[UINib nibWithNibName:[CustomFooterForCartList nibName]
                                    bundle:[NSBundle mainBundle]];
    
    [self.tableView     registerNib:footerNib
 forHeaderFooterViewReuseIdentifier:[CustomFooterForCartList footerReuseID]];
    
    return footer;
}

-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView
               editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowActions;
}

@end
