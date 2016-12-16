//
//  UIView+VFL.h
//
//
//  Created by DLB on 16/12/15.
//  Copyright © 2016年 zhu lai fei. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 * 此类针对VFL的简单封装,代码通俗易懂,仅仅实用与日常开发.缺点:{
 *    1, 不能设置约束优先级(项目涉及不到);
 *    2, 不能断开一个约束 ;
 *    3,不能自动识别缺少的约束和多余的约束,开发者自行提高开发意识;
 *    4 当然不能跟masony相提并论啦!!,但是可控性高,你可以加自己喜欢的接口
 }
 * @demo:
 *    view.topTo(self.view,10)
 *    .leftTo.(self.view,10)
 *    .bottomTo(self.view,20)
 *    .rightTo(rightView,50);
 *
 * @notification(important):
 *    调用之前需要做两件事:1 :translatesAutoresizingMaskIntoConstraints = NO;
 *    2 :在调用本代码之前需要先加载到父视图(addSubview)!
 * 
 * @abstract:
 *   1,关于widthConstraint&heightConstraint仅仅适用于调用widthEqualTo & heightTo,因为:widthLessThan等并不是一个真正的约束,而是限制了约束值的范围(不爽自己加代码咯).
 *   2,关于centerX 和 centerY 目前不会开放constraint 接口 ,项目用不到.
 *
 * @license: zhu laifei MIT.US.
 *
 */
@interface UIView (VFL)
/**
 * 顶部
 */
@property (nonatomic ,strong, readonly)NSLayoutConstraint * topConstraint ;
@property (nonatomic ,copy)UIView * (^TopTo)(UIView * ,CGFloat) ;

/**
 * 左边
 */
@property (nonatomic ,strong ,readonly) NSLayoutConstraint * leftConstraint  ;
@property (nonatomic ,copy)UIView * (^leftTo)(UIView * ,CGFloat) ;

/**
 * 底部
 */
@property (nonatomic ,strong ,readonly) NSLayoutConstraint * bottomConstraint  ;
@property (nonatomic ,copy)UIView * (^bottomTo)(UIView * ,CGFloat) ;

/**
 * 右边
 */
@property (nonatomic ,strong ,readonly) NSLayoutConstraint * rightConstraint  ;
@property (nonatomic ,copy)UIView * (^rightTo)(UIView * ,CGFloat) ;

/**
 * 宽度
 */
@property (nonatomic ,strong ,readonly) NSLayoutConstraint * widthConstraint  ;
@property (nonatomic ,copy)UIView * (^widthEqualTo)(CGFloat) ;
@property (nonatomic ,copy)UIView * (^widthGraterThan)(CGFloat);
@property (nonatomic ,copy)UIView * (^widthLessThan)(CGFloat) ;
@property (nonatomic ,copy)UIView * (^widthRange)(CGFloat min,CGFloat max) ;

/**
 * 高度
 */
@property (nonatomic ,strong ,readonly) NSLayoutConstraint *heightConstraint  ;
@property (nonatomic ,copy)UIView * (^heightEqualTo)(CGFloat) ;
@property (nonatomic ,copy)UIView * (^heightGraterThan)(CGFloat)  ;
@property (nonatomic ,copy)UIView * (^heightLessThan)(CGFloat) ;
@property (nonatomic ,copy)UIView * (^heightRange)(CGFloat min , CGFloat max) ;

/**
 *中心
 */
@property (nonatomic ,copy)UIView * (^centerXTo)(UIView * ,CGFloat offset) ;
@property (nonatomic ,copy)UIView * (^centerYTo)(UIView * ,CGFloat offset) ;



@end
