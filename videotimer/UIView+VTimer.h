//
//  UIView+VTimer.h
//  videotimer
//
//  Created by Suxin on 11/19/17.
//  Copyright © 2017 Suxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICountingLabel;
@class CyLabel;

@interface UIView (VTimer)

- (void)setBackgroundImageNamed:(NSString*)baseName;

// subview helpers

- (UIView *)addPanel;
- (UIView *)addHeaderToPanel:(UIView *)panel;
- (UIView *)addHeaderToPanel:(UIView *)panel withHeight:(CGFloat)height;
- (UIView *)addFooterToPanel:(UIView *)panel;
- (UIView *)addFooterToPanel:(UIView *)panel withHeight:(CGFloat)height;

- (UILabel *)addLabelWithText:(NSString *)stringId color:(UIColor *)color font:(UIFont *)font;
- (UILabel *)addLabelWithAttributedText:(NSAttributedString *)attrString color:(UIColor *)defaultColor font:(UIFont *)defaultFont;
- (UICountingLabel *)addCountingLabelFormat:(NSString *)format color:(UIColor *)defaultColor font:(UIFont *)defaultFont;
- (CyLabel *)addCurrencyLabelWithFont:(UIFont *)font color:(UIColor*)color;
- (CyLabel *)addCurrencyLabelWithFont:(UIFont *)font color:(UIColor*)color negativeColor:(UIColor *)negColor;
- (UISlider *)addSliderWithTrackImageNamed:(NSString *)trackImgName thumbImageNamed:(NSString *)thumbImgName;
- (UIButton *)addButtonWithTitle:(NSString *)stringId backgroundImageNamed:(NSString *)imageId font:(UIFont *)font;
- (UIButton *) addButtonWithTitle:(NSString *)stringId backgroundImageNames:(NSArray *)imageIds font:(UIFont *)font;
- (UIImageView *)addImageNamed:(NSString *)imageId;
- (UIImageView *)addImageNamed:(NSString *)imageId widthConstrained:(BOOL)wc heightConstrained:(BOOL)hc;
- (UIView *)addContainerWithBackgroundImageNamed:(NSString *)imageId;
- (UIView *)addVerticalSpacer;
- (UIView *)addVerticalSpacerBetween:(UIView *)v1 and:(UIView *)v2;
- (UIView *)addHorizontalSpacer;
- (UIView *)addHorizontalSpacerBetween:(UIView *)v1 and:(UIView *)v2;
- (void)setBackgroundImageNamed:(NSString *)imageId toButton:(UIButton *)button;
- (void)setThumbImageNamed:(NSString *)imageId toSlider:(UISlider *)slider;

// layout helpers

- (UIView *)placedAtX:(CGFloat)x;
- (UIView *)placedAtY:(CGFloat)y;
- (UIView *)centerX;
- (UIView *)centerX:(UIView *)sibling;
- (UIView *)centerX:(UIView *)container atOffset:(CGFloat)offset;
- (UIView *)centerY;
- (UIView *)centerY:(UIView *)sibling;
- (UIView *)spaceX:(CGFloat)spc from:(UIView *)sibling;
- (UIView *)spaceXAtLeast:(CGFloat)spc from:(UIView *)sibling;
- (UIView *)spaceY:(CGFloat)spc from:(UIView *)sibling;
- (UIView *)alignBaseline:(UIView *)sibling;
- (UIView *)alignTop:(UIView *)sibling;
- (UIView *)alignTop:(UIView *)sibling atOffset:(CGFloat)offset;
- (UIView *)alignBottom:(UIView *)sibling;
- (UIView *)alignLeft:(UIView *)sibling;
- (UIView *)alignRight:(UIView *)sibling;
- (UIView *)setWidth:(CGFloat)width;
- (UIView *)setHeight:(CGFloat)height;
- (UIView *)marginLeft:(CGFloat)marginToSuperView;
- (UIView *)marginRight:(CGFloat)marginToSuperView;
- (UIView *)marginTop:(CGFloat)marginToSuperView;
- (UIView *)marginBottom:(CGFloat)marginToSuperView;
- (UIView *)marginBottomAtLeast:(CGFloat)marginToSuperView;
- (UIView *)yCenterBetween:(UIView *)topView and:(UIView *)bottomView;
- (UIView *)equalWidth:(UIView *)anotherView;
- (UIView *)equalHeight:(UIView *)anotherView;

- (CGFloat)leftOffsetForCenteringView:(UIView *)view1 andView:(UIView *)view2 andGap:(CGFloat)gap;

// borders
// based on http://stackoverflow.com/questions/7666863/uiview-bottom-border
- (void)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
- (void)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
- (void)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
- (void)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

// others
- (void)rotateClockwise:(BOOL)cw duration:(CGFloat)duration;
@end




