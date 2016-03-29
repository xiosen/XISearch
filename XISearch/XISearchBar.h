//
//  XISearchBar.h
//  XISearch
//
//  Created by xi on 16/3/28.
//  Copyright © 2016年 xi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedBlock)();
@interface XIResultSearchBar : UISearchBar

- (void)itemsAndIconButtonSelectedBlock:(SelectedBlock)selectedBlock;

@end


@interface XISearchBar : UISearchBar
@property (nonatomic , strong) UIButton *scanButton;
@end
