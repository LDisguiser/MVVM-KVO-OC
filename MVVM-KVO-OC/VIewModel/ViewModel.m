//
//  ViewModel.m
//  MVVM-KVO-OC
//
//  Created by 李贺 on 2019/10/28.
//  Copyright © 2019 李贺. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"

@interface ViewModel ()

@property (nonatomic, strong)Model *model;

@end

@implementation ViewModel

// viewModel 绑定 model, 反过来不行
// 这里通常是获取数据, 进行数据转模型, 然后传递出去dataArray
- (void)getData {
    
    int randomNumber = arc4random();
    if(randomNumber % 2){
        // 注意: 一定要先获取到数据, 转完模型, 方可改变kvo监听的信号.
        self.model.name = @"Tom";
        self.nameString = self.model.name;
        self.racMsg = @"success";
    }else{
        self.model.name = @"Error";
        self.nameString = self.model.name;
        self.racMsg = @"fail";
    }
}

- (Model *)model{
    
    if(!_model){
        _model = [Model new];
    }
    return _model;
}

@end
