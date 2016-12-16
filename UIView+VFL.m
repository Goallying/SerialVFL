//
//  UIView+VFL.m
//  tttt
//
//  Created by DLB on 16/12/15.
//  Copyright © 2016年 zhu. All rights reserved.
//

#import "UIView+VFL.h"
#import <objc/runtime.h>

static void * topConstraintKey = "topConstraintKey";
static void * leftConstraintKey = "leftConstraintKey";
static void * bottomConstraintKey = "bottomConstraintKey";
static void * rightConstraintKey = "rightConstraintKey";
static void * widthConstraintKey = "widthConstraintKey";
static void * heightConstraintKey = "heightConstraintKey";


@implementation UIView (VFL)
@dynamic TopTo ;
@dynamic leftTo;
@dynamic bottomTo;
@dynamic rightTo;

@dynamic widthEqualTo;
@dynamic widthGraterThan;
@dynamic widthLessThan;
@dynamic widthRange;
@dynamic widthConstraint;

@dynamic heightEqualTo;
@dynamic heightGraterThan;
@dynamic heightLessThan;
@dynamic heightRange;
@dynamic heightConstraint;

@dynamic centerXTo;
@dynamic centerYTo;

#pragma mark -- Top Margin

-(UIView *(^)(UIView *, CGFloat))TopTo{
    
    return ^(UIView * topView , CGFloat value){
        
        NSDictionary * viewsDic = @{@"topView":topView,
                                    @"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
        
        NSString * visualConstraint ;
        if (self.superview == topView) {
            visualConstraint = @"V:|-value-[targetView]" ;
        }else{
            visualConstraint = @"V:[topView]-value-[targetView]";
        }
        NSLayoutConstraint * topConstraint = [NSLayoutConstraint constraintsWithVisualFormat:visualConstraint options:0 metrics:mertric views:viewsDic][0] ;
        
        objc_setAssociatedObject(self, topConstraintKey, topConstraint, OBJC_ASSOCIATION_RETAIN) ;
        
        [self.superview addConstraint:topConstraint];
      
        return  self;
    };
}
-(NSLayoutConstraint *)topConstraint{
    
    NSLayoutConstraint * topConstraint = objc_getAssociatedObject(self, topConstraintKey) ;
    if (topConstraint) {
        return topConstraint;
    }
    return nil;
}
#pragma  mark -- Left Margin
-(UIView *(^)(UIView *, CGFloat))leftTo{
    
    return ^(UIView * leftView , CGFloat value){
        
        NSDictionary * viewsDic = @{@"leftView":leftView,
                                    @"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
    
        NSString * visualConstraint ;
        if (self.superview == leftView) {
            visualConstraint = @"H:|-value-[targetView]" ;
        }else{
            visualConstraint = @"H:[leftView]-value-[targetView]";
        }
        NSLayoutConstraint * leftConstraint  = [NSLayoutConstraint constraintsWithVisualFormat:visualConstraint options:0 metrics:mertric views:viewsDic][0] ;
        
        objc_setAssociatedObject(self, leftConstraintKey, leftConstraint, OBJC_ASSOCIATION_RETAIN) ;
        
        [self.superview addConstraint:leftConstraint];
        
        return  self;
    };
}
-(NSLayoutConstraint *)leftConstraint{
    NSLayoutConstraint * leftConstraint = objc_getAssociatedObject(self, leftConstraintKey) ;
    if (leftConstraint) {
        return leftConstraint ;
    }
    return  nil;
}
#pragma  mark -- Bottom Margin
-(UIView *(^)(UIView *, CGFloat))bottomTo{
    
    return ^(UIView * bottomView , CGFloat value){

        NSDictionary * viewsDic = @{@"bottomView":bottomView,
                                    @"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
        NSString * visualConstraint ;
        if (self.superview == bottomView) {
            visualConstraint = @"V:[targetView]-value-|" ;
        }else{
            visualConstraint = @"V:[targetView]-value-[bottomView]" ;
        }
        NSLayoutConstraint * bottomConstraint = [NSLayoutConstraint constraintsWithVisualFormat:visualConstraint options:0 metrics:mertric views:viewsDic][0] ;
        
        objc_setAssociatedObject(self, bottomConstraintKey, bottomConstraint, OBJC_ASSOCIATION_RETAIN) ;
        [self.superview addConstraint:bottomConstraint];
        
        return  self;
    };
}
-(NSLayoutConstraint *)bottomConstraint{
    NSLayoutConstraint * bottomConstraint = objc_getAssociatedObject(self, bottomConstraintKey) ;
    if (bottomConstraint) {
        return bottomConstraint ;
    }
    return  nil;
}
#pragma  mark -- Right Margin
-(UIView *(^)(UIView *, CGFloat))rightTo{
    
    return ^(UIView * rightView , CGFloat value){
        
        NSDictionary * viewsDic = @{@"rightView":rightView,
                                    @"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
        
        NSString * visualConstraint ;
        if (self.superview == rightView) {
            visualConstraint = @"H:[targetView]-value-|" ;
        }else{
            visualConstraint = @"H:[targetView]-value-[rightView]";
        }
       NSLayoutConstraint * rightConstraint = [NSLayoutConstraint constraintsWithVisualFormat:visualConstraint options:0 metrics:mertric views:viewsDic][0] ;
        
        objc_setAssociatedObject(self, rightConstraintKey, rightConstraint, OBJC_ASSOCIATION_RETAIN) ;
        [self.superview addConstraint:rightConstraint];
        
        return  self;
    };
}
-(NSLayoutConstraint *)rightConstraint{
    NSLayoutConstraint * rightConstraint = objc_getAssociatedObject(self, rightConstraintKey) ;
    if (rightConstraint) {
        return rightConstraint ;
    }
    return  nil;
}
#pragma  mark -- Width Margin
-(UIView *(^)(CGFloat))widthEqualTo{
    
    return ^(CGFloat value){
        
        NSDictionary * viewsDic = @{@"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
        NSLayoutConstraint * widthConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[targetView(value)]" options:0 metrics:mertric views:viewsDic][0];
        objc_setAssociatedObject(self, widthConstraintKey, widthConstraint, OBJC_ASSOCIATION_RETAIN) ;
        [self addConstraint:widthConstraint] ;
        return self;
    } ;
}

-(UIView *(^)(CGFloat))widthGraterThan{
    
    return ^(CGFloat value){
        
        NSDictionary * viewsDic = @{@"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
        NSLayoutConstraint * widthGraterConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[targetView(>=value)]" options:0 metrics:mertric views:viewsDic][0];
        [self addConstraint:widthGraterConstraint] ;

        return self;
    };
}
-(UIView *(^)(CGFloat))widthLessThan{
    
    return ^(CGFloat value){
        
        NSDictionary * viewsDic = @{@"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
        NSLayoutConstraint * widthLessConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[targetView(<=value)]" options:0 metrics:mertric views:viewsDic][0];
        [self addConstraint:widthLessConstraint] ;
        
        return self;
    } ;
}
-(UIView *(^)(CGFloat, CGFloat))widthRange{
    return ^(CGFloat min , CGFloat max){
        
        NSDictionary * viewsDic = @{@"targetView":self};
        NSDictionary * mertric  = @{@"valueMin":@(min),
                                    @"valueMax":@(max)};
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[targetView(>=valueMin)]" options:0 metrics:mertric views:viewsDic]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[targetView(<=valueMax)]" options:0 metrics:mertric views:viewsDic]];
        return self;
    };
}
-(NSLayoutConstraint *)widthConstraint{
    NSLayoutConstraint * widthConstraint = objc_getAssociatedObject(self, widthConstraintKey) ;
    if (widthConstraint) {
        return widthConstraint ;
    }
    return  nil;
}
#pragma  mark -- Height Margin
-(UIView *(^)(CGFloat))heightEqualTo{
    
    return ^(CGFloat value){
        
        NSDictionary * viewsDic = @{@"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
        NSLayoutConstraint * heightConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[targetView(value)]" options:0 metrics:mertric views:viewsDic][0];
        objc_setAssociatedObject(self, heightConstraintKey, heightConstraint, OBJC_ASSOCIATION_RETAIN) ;
        
        [self addConstraint:heightConstraint] ;
        
        return self;
    };
}
-(UIView *(^)(CGFloat))heightGraterThan{
    return ^(CGFloat value){
        
        NSDictionary * viewsDic = @{@"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
        NSLayoutConstraint * heightGraterConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[targetView(>=value)]" options:0 metrics:mertric views:viewsDic][0];
        [self addConstraint:heightGraterConstraint] ;
        
        return self;
    } ;
}
-(UIView *(^)(CGFloat))heightLessThan{
    
    return ^(CGFloat value){
        
        NSDictionary * viewsDic = @{@"targetView":self};
        NSDictionary * mertric  = @{@"value":@(value)};
        NSLayoutConstraint * heightLessConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[targetView(<=value)]" options:0 metrics:mertric views:viewsDic][0];
        [self addConstraint:heightLessConstraint] ;
        
        return self;
    };
}
-(UIView *(^)(CGFloat, CGFloat))heightRange{
    return ^(CGFloat min , CGFloat max){
        
        NSDictionary * viewsDic = @{@"targetView":self};
        NSDictionary * mertric  = @{@"valueMin":@(min),
                                    @"valueMax":@(max)};
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[targetView(>=valueMin)]" options:0 metrics:mertric views:viewsDic]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[targetView(<=valueMax)]" options:0 metrics:mertric views:viewsDic]];
        
        return self;
    };
}
-(NSLayoutConstraint *)heightConstraint{
    
    NSLayoutConstraint * heightConstraint = objc_getAssociatedObject(self, heightConstraintKey) ;
    if (heightConstraint) {
        return heightConstraint ;
    }
    return  nil;
}

#pragma mark -- Center Margin
-(UIView *(^)(UIView *, CGFloat))centerXTo{
    return ^(UIView * centerXView , CGFloat offset){
        
        [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:centerXView attribute:NSLayoutAttributeCenterX multiplier:1 constant:offset]];
        
        return self;
    };
}
-(UIView *(^)(UIView *, CGFloat))centerYTo{
    
    return ^(UIView * centerYView , CGFloat offset){
        
        [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:centerYView attribute:NSLayoutAttributeCenterY multiplier:1 constant:offset]];
        
        return self;
    };
}
@end
