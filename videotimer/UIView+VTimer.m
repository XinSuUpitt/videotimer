//
//  UIView+VTimer.m
//  videotimer
//
//  Created by Suxin on 11/19/17.
//  Copyright © 2017 Suxin. All rights reserved.
//

#import "UIView+VTimer.h"
#import "VTManager.h"

@implementation UIView (VTimer)


#pragma mark - Layout helpers

- (UIView *)placedAtX:(CGFloat)x {

    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.superview
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.f
                                                           constant:x];
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)placedAtY:(CGFloat)y {

    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.superview
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.f
                                                           constant:y];
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)centerX {
    return [self centerX:self.superview];
}

- (UIView *)centerX:(UIView *)sibling {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *center = [NSLayoutConstraint constraintWithItem:self
                                                              attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:sibling
                                                              attribute:NSLayoutAttributeCenterX
                                                             multiplier:1.f
                                                               constant:0.f];
    
    [self.superview addConstraint:center];
    return self;
}

- (UIView *)centerX:(UIView *)container atOffset:(CGFloat)offset {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *center = [NSLayoutConstraint constraintWithItem:self
                                                              attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:container
                                                              attribute:NSLayoutAttributeLeft
                                                             multiplier:1.f
                                                               constant:offset];
    
    [self.superview addConstraint:center];
    return self;
}

- (UIView *)centerY {
    return [self centerY:self.superview];
}


- (UIView *)centerY:(UIView *)sibling {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *superview = [self commonSuperview:sibling];
    NSLayoutConstraint *center = [NSLayoutConstraint constraintWithItem:self
                                                              attribute:NSLayoutAttributeCenterY
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:sibling
                                                              attribute:NSLayoutAttributeCenterY
                                                             multiplier:1.f
                                                               constant:0.f];
    
    [superview addConstraint:center];
    return self;
}


- (UIView *)spaceY:(CGFloat)spc from:(UIView *)sibling {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    sibling.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:sibling
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.f
                                                           constant:spc];
    
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)spaceX:(CGFloat)spc from:(UIView *)sibling {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    sibling.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:sibling
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.f
                                                           constant:spc];
    
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)spaceXAtLeast:(CGFloat)spc from:(UIView *)sibling {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    sibling.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                             toItem:sibling
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.f
                                                           constant:spc];
    
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)alignBaseline:(UIView *)sibling {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    sibling.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeBaseline
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:sibling
                                                          attribute:NSLayoutAttributeBaseline
                                                         multiplier:1.f
                                                           constant:0.f];
    
    [self.superview addConstraint:c1];
    return self;
}


- (UIView *)alignTop:(UIView *)reference {
    return [self alignTop:reference atOffset:0];
}

- (UIView *)alignTop:(UIView *)reference  atOffset:(CGFloat)offset {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    reference.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:reference
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.f
                                                           constant:offset];
    
    UIView *superView = [self commonSuperview:reference];
    [superView addConstraint:c1];
    return self;
}

- (UIView *)alignBottom:(UIView *)sibling {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    sibling.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:sibling
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.f
                                                           constant:0.f];
    
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)alignLeft:(UIView *)sibling {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    sibling.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:sibling
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.f
                                                           constant:0.f];
    
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)alignRight:(UIView *)sibling {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    sibling.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:sibling
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.f
                                                           constant:0.f];
    
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)setWidth:(CGFloat)width {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.f
                                                           constant:width];
    
    [self addConstraint:c1];
    return self;
}

- (UIView *)setHeight:(CGFloat)height {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.f
                                                           constant:height];
    
    [self addConstraint:c1];
    return self;
}

- (UIView *)marginLeft:(CGFloat)marginToSuperView {
    return [self placedAtX:marginToSuperView];
}

- (UIView *)marginRight:(CGFloat)marginToSuperView {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.superview
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.f
                                                           constant:-marginToSuperView];    // notice the minus
    
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)marginTop:(CGFloat)marginToSuperView {
    return [self placedAtY:marginToSuperView];
}

- (UIView *)marginBottom:(CGFloat)marginToSuperView {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.superview
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.f
                                                           constant:-marginToSuperView];    // notice the minus
    
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *)marginBottomAtLeast:(CGFloat)marginToSuperView {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationLessThanOrEqual
                                                             toItem:self.superview
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.f
                                                           constant:-marginToSuperView];    // notice the minus
    
    [self.superview addConstraint:c1];
    return self;
}

- (UIView *) yCenterBetween:(UIView *)topView and:(UIView *)bottomView {
    UIView *superView = [self commonSuperview:topView];
    superView = [superView commonSuperview:bottomView];
    if (superView != nil) {
        // add an invisible guide view
        UIView *guideView = [[UIView alloc] init];
        [superView addSubview:guideView];
        [superView sendSubviewToBack:guideView];
        
        // the x placement doesn't matter, we make it narrow
        [[guideView alignLeft:self] setWidth:10.f];
        
        // place it between the top and bottom views
        [guideView spaceY:0 from:topView];
        [bottomView spaceY:0 from:guideView];
        
        [self centerY:guideView];
    }
    
    return self;
}

- (UIView *)equalWidth:(UIView *)anotherView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:anotherView
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.f
                                                           constant:0];
    
    UIView *superView = [self commonSuperview:anotherView];
    [superView addConstraint:c1];
    return self;
}

- (UIView *)equalHeight:(UIView *)anotherView {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:anotherView
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1.f
                                                           constant:0];
    
    UIView *superView = [self commonSuperview:anotherView];
    [superView addConstraint:c1];
    return self;
}


// http://stackoverflow.com/questions/22666535/shared-ancestor-between-two-views
- (UIView *) commonSuperview:(UIView *)otherView {
    NSMutableSet *views = [NSMutableSet set];
    UIView *view = self;
    
    do {
        if (view != nil) {
            if ([views member:view])
                return view;
            [views addObject:view];
            view = view.superview;
        }
        
        if (otherView != nil) {
            if ([views member:otherView])
                return otherView;
            [views addObject:otherView];
            otherView = otherView.superview;
        }
    } while (view || otherView);
    
    return nil;
}


- (CGFloat)leftOffsetForCenteringView:(UIView *)view1 andView:(UIView *)view2 andGap:(CGFloat)gap {
    // force the os to layout all the controls so we'll know the sizes of the buttons
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    
    CGFloat offsetX = (self.frame.size.width - gap - view1.frame.size.width - view2.frame.size.width) / 2.f;
    
    return offsetX;
}

#pragma mark - Borders


- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

#pragma mark - Other helpers
- (void)rotateClockwise:(BOOL)cw duration:(CGFloat)duration {
    if ([self.layer animationForKey:@"inifiteRotation"] == nil) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        anim.fromValue = @(0.0);
        anim.toValue = cw? @(M_PI * 2.0) : @(M_PI * -2.0);
        anim.duration = duration;
        anim.repeatCount = HUGE_VALF;
        
        [self.layer addAnimation:anim forKey:@"infiteRotation"];
    }
}
@end
