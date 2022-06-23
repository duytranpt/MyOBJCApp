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
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _label.textColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:1.0];
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

    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"HomeMyProfile" bundle:nil];
    HomeMyProfileViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeMyProfile"];
        [self.navigationController pushViewController:controller animated:NO];
}
- (IBAction)secondScreen:(id)sender {
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"ProfileVC" bundle:nil];
    ProfileViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"ProfileID"];
        [self.navigationController pushViewController:controller animated:NO];
}

- (IBAction)gotoMyProfile:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MyProfile" bundle:nil];
    MyProfileViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"MyProfile"];
        [self.navigationController pushViewController:controller animated:YES];
}

@end
