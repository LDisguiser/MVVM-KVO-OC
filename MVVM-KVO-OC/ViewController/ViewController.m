//
//  ViewController.m
//  MVVM-KVO-OC
//
//  Created by 李贺 on 2019/10/26.
//  Copyright © 2019 李贺. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "View.h"

@interface ViewController ()

@property (nonatomic, strong)View *aView;
@property (nonatomic, strong)ViewModel *aViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    // 添加视图
    [self.view addSubview:self.aView];
    
    /*绑定关系*/
    // view 绑定 viewModel, 反过来不行.
    [self.aView bindViewModel:self.aViewModel];
}

- (View *)aView{
    
    if(!_aView){
        _aView = [View new];
    }
    return _aView;
}

@end
