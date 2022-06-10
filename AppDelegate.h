//
//  AppDelegate.h
//  MyOBJCApp
//
//  Created by Duy Tran on 07/06/2022.
//


#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet ViewController *rootViewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
