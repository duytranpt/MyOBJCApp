//
//  ViewController.m
//  MyOBJCApp
//
//  Created by Duy Tran on 07/06/2022.
//

#import "ViewController.h"
#import "MyOBJCApp-Swift.h"
#import "HomeViewController.h"

@interface ViewController ()
//@property (nonatomic, strong) FirstViewController *FirstVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UINavigationBar* navigationbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, UIApplication.sharedApplication.statusBarFrame.size.height, self.view.frame.size.width, 50)];
//    UINavigationItem* navigationItem = [[UINavigationItem alloc] initWithTitle:@"Home"];
//    [navigationbar setItems:@[navigationItem]];
//    [self.view addSubview:navigationbar];

  
}

- (IBAction)gotoFirstVC:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"First" bundle:nil];
    FirstViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"First"];
        [self.navigationController pushViewController:controller animated:NO];
}
- (IBAction)HomeButton:(id)sender {

    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    SecondViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"Second"];
        [self.navigationController pushViewController:controller animated:NO];
}
- (IBAction)secondScreen:(id)sender {
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"ProfileVC" bundle:nil];
    ProfileViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"ProfileID"];
        [self.navigationController pushViewController:controller animated:NO];
}

@end
