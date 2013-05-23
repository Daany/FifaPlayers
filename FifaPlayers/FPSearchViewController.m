
//  FPFirstViewController.m
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import "FPSearchViewController.h"
#import "FPDataProvider.h"
#import "FPPlayerBase.h"
#import "FPPlayerViewController.h"

@interface FPSearchViewController()

@property (nonatomic, strong) NSArray *players;

@end

@implementation FPSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    self.progressBar.hidden = YES;
    self.searchPlayerTableview.dataSource = self;
    self.searchPlayerTableview.delegate = self;
    self.searchBar.delegate = self;
    self.isSearching = NO;
    if(self.filteredList == NULL)
    {
        self.filteredList = [[NSMutableArray alloc]init];
    }
    else
    {

        [self.searchPlayerTableview reloadData];
    }
    
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    
    // set returnkey to done-button
    for(UIView *subView in self.searchBar.subviews) {
        if([subView conformsToProtocol:@protocol(UITextInputTraits)]) {
            UITextField *textField = (UITextField *)subView ;
            textField.returnKeyType = UIReturnKeyDone;
            textField.delegate = self;
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            textField.placeholder = @"Search player by name or club...";
            textField.enablesReturnKeyAutomatically = NO;
            break;
        }
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    if (self.navigationController.viewControllers.count == 1)
    {
        self.makeUpdates = YES;
    }
    else
    {
        self.makeUpdates = NO;
    }
}

- (void)setPLayerList:(NSMutableArray *)list
{
    self.players = [NSArray arrayWithArray:list];
    self.filteredList = list;
}

- (void)disableUpdates
{
    self.makeUpdates = NO;
}

-(void)filterListForSearchText:(NSString *)searchText
{
    if (searchText.length < 3 && self.makeUpdates)
    {
        // reset local filter
        self.isLocalFilter = false;
        
        // clear list
        self.filteredList = nil;
        [self.searchPlayerTableview reloadData];    
    }
    
    else if (searchText.length == 3 && self.isLocalFilter == false && self.makeUpdates)
    {
        self.progressBar.hidden = NO;
        [self.progressBar startAnimating];
        self.isLocalFilter = true;
        self.onWebRequest = YES;
        // Load data from webserver
        FPDataProvider *provider = [[FPDataProvider alloc]init];
        [provider SearchPlayer:searchText withResponseMethod:^(NSMutableArray *playersList)
         {
             // update data
             self.players = playersList;
             self.filteredList = [NSMutableArray arrayWithArray:playersList];
             
             [self.searchPlayerTableview reloadData];
             
             // reset on web request, so filter is allowed again
             self.onWebRequest = NO;
             
             // filter if user already typed more letters
             if (self.searchBar.text.length > 3)
             {
                 [self filterListForSearchText:self.searchBar.text];
             }
             [self.progressBar stopAnimating];
             self.progressBar.hidden = YES;
         }];
    }
    
    else
    {
        // Filter data in list
        [self.filteredList removeAllObjects]; //clears the array from all the string objects it might contain from the previous searches
        
        for(FPPlayerBase * player in self.players)
        {
            NSRange fullNameRange = [player.Fullname rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            NSRange clubRange = [player.Club rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (fullNameRange.location != NSNotFound || clubRange.location != NSNotFound)
            {
                [self.filteredList addObject:player];
            }
        }
        [self.searchPlayerTableview reloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    // Usually the number of items in your array (the one that holds your list)
    return self.filteredList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Where we configure the cell in each row
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if ([self.filteredList count])
    {
        //If the user is searching, use the list in our filteredList array.
        cell.textLabel.text = ((FPPlayerBase*)[self.filteredList objectAtIndex:indexPath.row]).Fullname;
    }
  
    return cell;
}

-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        return indexPath;
}

 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
 // Return NO if you do not want the specified item to be editable.
 return NO;
 }
 


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
    // Delete the row from the data source
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
        else if (editingStyle == UITableViewCellEditingStyleInsert) {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
 }
 

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    // If you want to push another view upon tapping one of the cells on your table.
    
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    self.selectedPlayer = [self.filteredList objectAtIndex:indexPath.row];

    [self performSegueWithIdentifier:@"Detail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FPPlayerViewController *controller = (FPPlayerViewController *)segue.destinationViewController;
    controller.player = self.selectedPlayer;
}


-(void)closeViewController
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UISearchControllerDelegate

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{   
    if (searchText.length > 0 && self.onWebRequest == NO)
    {
        [self filterListForSearchText:searchText];
    }
}

-(void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{

}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{

}

-(void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
{
    [self filterListForSearchText:searchBar.text];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{

}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.isSearching = YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self filterListForSearchText:@""];
    return YES;
}

-(void)doneButtonClicked:(id)sender
{
    [self.searchBar resignFirstResponder];
    [self.navigationItem setRightBarButtonItem:nil];
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
}

@end
