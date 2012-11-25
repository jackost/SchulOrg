//
//  StundenplanViewController.h
//  SchulOrg
//
//  Created by Jakob on 24.11.12.
//  Copyright (c) 2012 de.Brosu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StundenplanViewController : UITabBarController <UITabBarControllerDelegate>

@property (nonatomic, strong) NSMutableArray *montagArray;
@property (nonatomic, strong) NSMutableArray *dienstagArray;
@property (nonatomic, strong) NSMutableArray *mittwochArray;
@property (nonatomic, strong) NSMutableArray *donnerstagArray;
@property (nonatomic, strong) NSMutableArray *freitagArray;
@property (nonatomic, strong) NSMutableArray *schultageArray;

- (IBAction)addButtonPressed:(id)sender;

@end
