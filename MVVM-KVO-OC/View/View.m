//
//  View.m
//  MVVM-KVO-OC
//
//  Created by 李贺 on 2019/10/28.
//  Copyright © 2019 李贺. All rights reserved.
//

#import "View.h"
#import "ViewModel.h"

@interface View ()

@property (nonatomic, strong)ViewModel *viewModel;
@property (nonatomic, strong)UIButton *btn;

@end

@implementation View

- (instancetype)init {
    
    self = [super init];
    if(self){
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor whiteColor];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(150, 200, 100, 50);
        [btn setTitle:@"name" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        self.btn = btn;
    }
    return self;
}

- (void)buttonClick {
    
    if(self.viewModel){
        [self.viewModel getData];
    }
}

/// 绑定viewModel
- (void)bindViewModel:(id)viewModel {
    
    self.viewModel = viewModel;
    [self.viewModel addObserver:self forKeyPath:@"racMsg" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    NSLog(@"%@", [object nameString]);
    NSLog(@"%@", self.viewModel.nameString);
    
    if ([keyPath isEqualToString:@"racMsg"]) {
        if ([_viewModel.racMsg isEqualToString:@"success"]) {
            [self.btn setTitle:_viewModel.nameString forState:0];
        }
        else {
            [self.btn setTitle:_viewModel.nameString forState:0];
        }
    }
}

- (ViewModel *)viewModel{
    
    if(!_viewModel) {
        _viewModel = [ViewModel new];
    }
    return _viewModel;
}

@end
