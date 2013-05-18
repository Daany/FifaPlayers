
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

// Member variables
bool isLocalFilter;
bool isSearching;
bool onWebRequest;
bool makeUpdates = YES;
NSMutableArray *filteredList;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.searchPlayerTableview.dataSource = self;
    self.searchPlayerTableview.delegate = self;
    self.searchBar.delegate = self;
    
    isSearching = NO;
    if(filteredList == NULL)
    {
        filteredList = [[NSMutableArray alloc]init];
    }
    else
    {

        [self.searchPlayerTableview reloadData];
    }
    self.progressBar.hidesWhenStopped = YES;
    self.progressBar.hidden = YES;
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (void)setPLayerList:(NSMutableArray *)list
{
    self.players = [NSArray arrayWithArray:list];
    filteredList = list;
}

- (void)disableUpdates
{
    makeUpdates = NO;
}

-(void)filterListForSearchText:(NSString *)searchText
{
    self.progressBar.hidden = false;
   	[self.progressBar startAnimating];
    
    if (searchText.length < 3 && makeUpdates)
    {
        // reset local filter
        isLocalFilter = false;
        
        // clear list
        filteredList = nil;
        [self.searchPlayerTableview reloadData];
    }
    
    else if (searchText.length == 3 && isLocalFilter == false && makeUpdates)
    {
        isLocalFilter = true;
        onWebRequest = YES;
        // Load data from webserver
        FPDataProvider *provider = [[FPDataProvider alloc]init];
        [provider SearchPlayer:searchText withResponseMethod:^(NSMutableArray *playersList)
         {
             // update data
             [self.progressBar stopAnimating];
             self.players = playersList;
             filteredList = [NSMutableArray arrayWithArray:playersList];
             
             [self.searchPlayerTableview reloadData];
             
             // reset on web request, so filter is allowed again
             onWebRequest = NO;
             
             // filter if user already typed more letters
             if (self.searchBar.text.length > 3)
             {
                 [self filterListForSearchText:self.searchBar.text];
             }
         }];
    }
    
    else
    {
        // Filter data in list
        [filteredList removeAllObjects]; //clears the array from all the string objects it might contain from the previous searches
        
        for(FPPlayerBase * player in self.players)
        {
            NSRange fullNameRange = [player.Fullname rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            NSRange clubRange = [player.Club rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (fullNameRange.location != NSNotFound || clubRange.location != NSNotFound)
            {
                [filteredList addObject:player];
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
    return filteredList.count;
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
    if ([filteredList count])
    {
        //If the user is searching, use the list in our filteredList array.
        cell.textLabel.text = ((FPPlayerBase*)[filteredList objectAtIndex:indexPath.row]).Fullname;
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

    FPPlayerBase *selectedPlayer = [filteredList objectAtIndex:indexPath.row];
    
    FPPlayerViewController *playerViewController = [[FPPlayerViewController alloc]initWithPlayer:selectedPlayer NibName:nil bundle:nil];
    
    [self.navigationController pushViewController:playerViewController animated:YES];
    
//    [self presentViewController:playerViewController animated:YES completion:nil];
    
//    [self presentViewController:playerViewController animated:YES completion:nil];
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
    if (searchText.length > 0 && onWebRequest == NO)
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
    isSearching = YES;
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonClicked:)];
    
    //Add the done button.]
    [self.navigationItem setRightBarButtonItem:button animated:YES];
    
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
