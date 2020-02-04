//
//  MainTableViewController.m
//  NavigationContr+SeguePract
//
//  Created by Amantay on 21.10.17.
//  Copyright © 2017 Amantay. All rights reserved.
//

#import "MainTableViewController.h"
#import "ToBuyList.h"
#import "CustomCellForToBuyTable.h"
#import "CustomHeaderForToBuyList.h"
#import "CartListTableViewController.h"

static NSString* const cellID=@"tobuy-cell-reuse-identifier";
static NSString* const headerCellID=@"header-cell-reuse-identifier";
static NSString* const showCartListSegueID=@"cart-list-segue-identifier";

@interface MainTableViewController () <UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate>

@property(nonatomic, strong) IBOutlet UIBarButtonItem* goToCartButton;
@property(nonatomic, strong) ToBuyList* productList;
@property(nonatomic, strong) NSMutableArray<ToBuyItem*>* filteredProductList;
@property(nonatomic, strong) NSArray<UITableViewRowAction*>* rowActions;
@property(nonatomic, strong) UISearchController* searchController;

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.filteredProductList=[[NSMutableArray alloc]init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    self.searchController.obscuresBackgroundDuringPresentation = NO;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    
    self.tableView.tableHeaderView=self.searchController.searchBar;
    
    UINib* headerNib=[UINib nibWithNibName:[CustomHeaderForToBuyList nibName]
                                    bundle:[NSBundle mainBundle]];
    
    [self.tableView     registerNib:headerNib
 forHeaderFooterViewReuseIdentifier:[CustomHeaderForToBuyList headerReuseID]];
    
    self.productList=[[ToBuyList alloc]init];
    
    UITableViewRowAction* delete=
    [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
                                       title:@"❌"
                                     handler:^(UITableViewRowAction* action, NSIndexPath* indexPath)
     {
         [self.productList removeToBuyItemAtIndex:indexPath.row];
         [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                               withRowAnimation:UITableViewRowAnimationLeft];
         [self.productList saveData];
     }];
    delete.backgroundColor=[UIColor whiteColor];
    
    UITableViewRowAction* buy=
    [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
                                       title:@"✅"
                                     handler:^(UITableViewRowAction* action, NSIndexPath* indexPath)
     {
         [self buyProduct:indexPath];
     }];
    buy.backgroundColor=[UIColor whiteColor];
    
    self.rowActions=@[buy, delete];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(self.productList.cartItemList.count==0)
    {
        self.goToCartButton.enabled=NO;
    }
    
    CGPoint offset=CGPointMake(0, self.searchController.searchBar.frame.size.height);
    self.tableView.contentOffset=offset;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Button Methods

-(void)buyProduct:(NSIndexPath*)indexPath
{
    CartItem* item=[CartItem new];
    
    UIAlertController* askForProductData=
    [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@"
                                                 , self.productList.toBuyItemList[indexPath.row].name]
                                        message:@"Укажите цену и количество"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [askForProductData addTextFieldWithConfigurationHandler:^(UITextField* textField)
    {
        textField.placeholder=@"цена";
    }];
    
    [askForProductData addTextFieldWithConfigurationHandler:^(UITextField* textField)
     {
        textField.placeholder=@"количество";
     }];
    
    UIAlertAction* addCartItemButton=
    [UIAlertAction actionWithTitle:@"Добавить"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction* action)
                           {
                               if([[askForProductData textFields][0] text].length==0
                                  || [[askForProductData textFields][1] text].length==0)
                               {
                                   UIAlertController* errorNotificationAlert=
                                   [UIAlertController
                                    alertControllerWithTitle:[NSString stringWithFormat:@"%@"
                                                              , self.productList.toBuyItemList[indexPath.row].name]
                                    message:@"Укажите цену и количество!"
                                    preferredStyle:UIAlertControllerStyleAlert];
                                   
                                   UIAlertAction* okImSorryAction=
                                   [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleCancel
                                                          handler:nil];
                                   
                                   [errorNotificationAlert addAction:okImSorryAction];
                                   
                                   [self presentViewController:errorNotificationAlert
                                                      animated:YES
                                                    completion:nil];
                               }
                               else
                               {
                                   [item setName:self.productList.toBuyItemList[indexPath.row].name];
                                   [item setPriceFromStringValue: [[askForProductData textFields][0] text]];
                                   [item setCountFromStringValue: [[askForProductData textFields][1] text]];
                                   [self.productList addCartItem:item];
                                   [self.productList saveData];
                                   self.goToCartButton.enabled=YES;
                               }
                           }];
    
    UIAlertAction* cancelAction=[UIAlertAction actionWithTitle:@"Отмена"
                                                         style:UIAlertActionStyleCancel
                                                       handler:nil];
    
    [askForProductData addAction:cancelAction];
    [askForProductData addAction:addCartItemButton];
        
    [self presentViewController:askForProductData
                       animated:YES
                     completion:nil];
}

#pragma mark Navigation

-(void)prepareForSegue:(UIStoryboardSegue*)segue
                sender:(id)sender
{
    [super prepareForSegue:segue
                    sender:sender];
    
    if([segue.identifier isEqualToString:showCartListSegueID])
    {
        CartListTableViewController* destinationCartList=segue.destinationViewController;
        [destinationCartList setList: self.productList];
    }
}

#pragma mark - Buttons Methods

-(IBAction) addButtonTap:(id)sender
{
    UIAlertController* askForProductName=
    [UIAlertController alertControllerWithTitle:@"Добавление товара"
                                        message:@"Укажите наименование:"
                                 preferredStyle:UIAlertControllerStyleAlert];
    [askForProductName addTextFieldWithConfigurationHandler:^(UITextField* textField)
     {
         textField.placeholder=@"наименование";
     }];
    UIAlertAction* addItemAction=
    [UIAlertAction actionWithTitle:@"Добавить"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction* action)
     {
         NSDate* currentDate=[NSDate date];
         
         ToBuyItem* item=[[ToBuyItem alloc]init];
         
         [item setName:[[askForProductName textFields][0] text]];
         [item setDate:currentDate];
         
         [self.productList addToBuyItem:item];
         [self.productList saveData];
         
         [self.tableView reloadData];
     }];
    
    UIAlertAction* cancelAction=
    [UIAlertAction actionWithTitle:@"Отменить"
                             style:UIAlertActionStyleCancel
                           handler:nil];
    
    [askForProductName addAction:addItemAction];
    [askForProductName addAction:cancelAction];
    
    [self presentViewController:askForProductName
                       animated:YES completion:nil];
}

-(void)searchBarCancelButtonClicked:(UISearchBar*)searchBar
{
    self.searchController.active=NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if(self.searchController.isActive && self.searchController.searchBar.text.length>0)
    {
        return self.filteredProductList.count;
    }
    
    else
    {
        return self.productList.toBuyItemList.count;
    }
}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    ToBuyItem* item=[ToBuyItem new];
    
    CustomCellForToBuyTable* cell=[tableView dequeueReusableCellWithIdentifier:cellID
                                                                  forIndexPath:indexPath];
    
    if(self.searchController.isActive && self.searchController.searchBar.text.length>0)
    {
        item=self.filteredProductList[indexPath.row];
        
        [cell setInfoAboutItem:item];
    }
    
    else
    {
        item=self.productList.toBuyItemList[indexPath.row];
        
        [cell setInfoAboutItem:item];
    }
    
    return cell;
}

-(NSArray<UITableViewRowAction*>*)tableView:(UITableView*)tableView
               editActionsForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return self.rowActions;
}

- (CGFloat)     tableView:(UITableView *)tableView
 heightForHeaderInSection:(NSInteger)section {
    return 28;
}


-(UIView*)     tableView:(UITableView *)tableView
   viewForHeaderInSection:(NSInteger)section
{
    CustomHeaderForToBuyList* header=
    [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:[CustomHeaderForToBuyList headerReuseID]];
    
    return header;
}

-(void)         tableView:(UITableView *)tableView
  didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self buyProduct:indexPath];
}

-(void)updateSearchResultsForSearchController:(UISearchController*)searchController
{
    NSString* searchQuery=self.searchController.searchBar.text;
    
    if(searchQuery.length>0)
    {
        NSPredicate* filterPredicate=[NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", @"name", searchQuery];
        
        self.filteredProductList=[NSMutableArray arrayWithArray:[self.productList.toBuyItemList filteredArrayUsingPredicate:filterPredicate]];
    }
    
    else
    {
        if(self.filteredProductList.count>0)
        {
            [self.filteredProductList removeAllObjects];
        }
    }
    
    [self.tableView reloadData];
}

@end
