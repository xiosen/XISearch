//
//  XISearchBar.m
//  XISearch
//
//  Created by xi on 16/3/28.
//  Copyright © 2016年 xi. All rights reserved.
//

#import "XISearchBar.h"

@interface XIResultSearchBar ()
@property (nonatomic ,  copy ) SelectedBlock selectedBlock;
@property (nonatomic , strong) UIButton *itemsButton;
@property (nonatomic , strong) UIButton *iconButton;
@end

@implementation XIResultSearchBar

- (void)layoutSubviews {
    [self setBackgroundImage:[UIImage new]];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.autoresizesSubviews = YES;
    NSPredicate *finalPredicate = [NSPredicate predicateWithBlock:^BOOL(UIView *candidateView, NSDictionary *bindings) {
        return [candidateView isMemberOfClass:NSClassFromString(@"UISearchBarTextField")];
    }];
    UITextField *searchTextField = [[self.subviews.firstObject.subviews filteredArrayUsingPredicate:finalPredicate] lastObject];
    searchTextField.frame = CGRectMake(40, 4.5, self.frame.size.width - 40, 22);
    UIImageView *leftView = (UIImageView *)searchTextField.leftView;
    leftView.frame = CGRectZero;
}

- (void)menuItemsSelectedBlock:(SelectedBlock)selectedBlock {
    [self addSubview:_itemsButton];
    if (selectedBlock) {
         _selectedBlock = selectedBlock;
    }
}

- (UIButton *)itemsButton {
    if (!_itemsButton) {
        _itemsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _itemsButton.frame = CGRectMake(self.frame.size.width - 50, 0, 50, 31);
        [_itemsButton setTitle:@"全部" forState:UIControlStateNormal];
        _itemsButton.backgroundColor = [UIColor redColor];
        [_itemsButton addTarget:self action:@selector(itemsOrIconButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_itemsButton];
    }
    return _itemsButton;
}

- (void)itemsOrIconButtonClicked {
    _selectedBlock();
}

- (void)refreshItemsButtonTitle:(NSString *)title {
    [_itemsButton setTitle:title forState:UIControlStateNormal];
}

@end


@implementation XISearchBar

- (void)layoutSubviews {
    [self setBackgroundImage:[UIImage new]];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [UIScreen mainScreen].bounds.size.width - 115, self.frame.size.height);
    self.autoresizesSubviews = YES;
    
    NSPredicate *finalPredicate = [NSPredicate predicateWithBlock:^BOOL(UIView *candidateView, NSDictionary *bindings) {
        return [candidateView isMemberOfClass:NSClassFromString(@"UISearchBarTextField")];
    }];
    
    UITextField *searchField = [[[[[self subviews] firstObject] subviews] filteredArrayUsingPredicate:finalPredicate] lastObject];
    [searchField setFrame:CGRectMake(-CGRectGetWidth(self.frame)/2 + 44, 4, CGRectGetWidth(self.frame), 22)];

    UIImageView *fieldLeftView = (UIImageView *)searchField.leftView;
    CGRect frame = fieldLeftView.frame;
    frame.size = CGSizeMake(13, 13);
    fieldLeftView.frame = frame;
}

- (UIButton *)scanButton {
    if (!_scanButton) {
        _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_scanButton setImage:[UIImage imageNamed:@"button_scan"] forState:UIControlStateNormal];
        _scanButton.frame = CGRectMake(self.frame.size.width - 50, 0, 50, 31);
        _scanButton.backgroundColor = [UIColor clearColor];
        [self addSubview:_scanButton];
    }
    return _scanButton;
}

@end
