//
//  View.h
//  MVVM-KVO-OC
//
//  Created by 李贺 on 2019/10/28.
//  Copyright © 2019 李贺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface View : UIView

- (void)bindViewModel:(id)viewModel;

@end

NS_ASSUME_NONNULL_END
