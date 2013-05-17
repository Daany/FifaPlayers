
//  FPFirstViewController.m
//  FifaPlayers
//
//  Created by Dany on 10.05.13.
//  Copyright (c) 2013 ch.hslu.pakadazi. All rights reserved.
//

#import "FPSearchViewController.h"
#import "FPDataProvider.h"
#import "FPPlayerBase.h"

@interface FPSearchViewController()

@property (nonatomic, strong) NSArray *players;

@end

@implementation FPSearchViewController

// Member variables
bool isLocalFilter;
bool isSearching;
bool letUserSelectRow = YES;
NSMutableArray *filteredList;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.searchPlayerTableview.dataSource = self;
    self.searchPlayerTableview.delegate = self;
    self.searchBar.delegate = self;
    
    isSearching = NO;
    filteredList = [[NSMutableArray alloc]init];
    self.progressBar.hidesWhenStopped = YES;
    self.progressBar.hidden = YES;
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
}

-(void)filterListForSearchText:(NSString *)searchText
{
    self.progressBar.hidden = false;
   	[self.progressBar startAnimating];
    
    if (searchText.length < 3)
    {
        // reset local filter
        isLocalFilter = false;
    }
    
    else if (searchText.length == 3 && isLocalFilter == false)
    {
        isLocalFilter = true;
        
        // Load data from webserver
        FPDataProvider *provider = [[FPDataProvider alloc]init];
        [provider SearchPlayer:searchText withResponseMethod:^(NSMutableArray *playersList)
         {
             // update data
             [self.progressBar stopAnimating];
             self.players = playersList;
             filteredList = [NSMutableArray arrayWithArray:playersList];
             [self.progressBar stopAnimating];
             [self.searchPlayerTableview reloadData];
         }];
    }
    
    else
    {
        // Filter data in list
        [filteredList removeAllObjects]; //clears the array from all the string objects it might contain from the previous searches
        
        for (NSString *title in self.players)
        {
            NSRange nameRange = [title rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (nameRange.location != NSNotFound)
            {
                [filteredList addObject:title];
                [self.searchPlayerTableview reloadData];
            }
        }
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
    return [self.players count];
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
    NSString *title;
    if (isSearching && [filteredList count])
    {
        //If the user is searching, use the list in our filteredList array.
        title = ((FPPlayerBase*)[filteredList objectAtIndex:indexPath.row]).Fullname;
    }
    
    else
    {
        title = ((FPPlayerBase*)[self.players objectAtIndex:indexPath.row]).Fullname;
    }
    
    cell.textLabel.text = title;
    
    return cell;
}

-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(letUserSelectRow)
        return indexPath;
    else
        return nil;
}

 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
 // Return NO if you do not want the specified item to be editable.
 return YES;
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
}

#pragma mark - UISearchControllerDelegate

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    
}

-(void)doneSearching_Clicked
{
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{   
    if (searchText.length > 0)
    {
        [self filterListForSearchText:searchText];
    }
    else
    {
        isSearching = NO;
        letUserSelectRow = NO;
        self.searchPlayerTableview = NO;
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

}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{

}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    isSearching = YES;
    letUserSelectRow = NO;
    
    //Add the done button.]
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSearching_Clicked:)];
    
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
}

@end
