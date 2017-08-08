//
//  UITextField+SwpSetTextField.m
//  swp_song
//
//  Created by swp_song on 16/6/3.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UITextField+SwpSetTextField.h"

@implementation UITextField (SwpSetTextField)

/**!
 *  @ author swp_song
 *
 *  @ brief  swpSetTextFieldStyle:setBorderColor:setTextColor:setBorderWidth:setCornerRadius:setPlaceholder:setTextFontSize:setKeyboardType:setTextEncrypt:  ( 设置 textField <没有左侧图片> )
 *
 *  @ param  textField           textField
 *
 *  @ param  borderColor         textField 边框颜色
 *
 *  @ param  textColor           textField 文字颜色
 *
 *  @ param  borderWidth         textField 边框
 *
 *  @ param  cornerRadius        textField 圆角弧度
 *
 *  @ param  placeholder         textField 显示的提示
 *
 *  @ param  textFontSize        textField 文字大小
 *
 *  @ param  keyboardType        textField 键盘样式
 *
 *  @ param  isEncrypt           textField 是否是密码键盘
 */
+ (void)swpSetTextFieldStyle:(UITextField *)textField setBorderColor:(UIColor *)borderColor setTextColor:(UIColor *)textColor setBorderWidth:(CGFloat)borderWidth setCornerRadius:(CGFloat)cornerRadius setPlaceholder:(NSString *)placeholder setTextFontSize:(CGFloat)textFontSize setKeyboardType:(UIKeyboardType)keyboardType setTextEncrypt:(BOOL)isEncrypt {
    
    // 边框圆角
    UIColor  *typeColor                   =  borderColor == nil ? [UIColor blackColor] : borderColor;
    
    // 边框圆角
    textField.backgroundColor             = [UIColor whiteColor];
    textField.layer.borderWidth           = borderWidth;
    textField.layer.cornerRadius          = cornerRadius;
    textField.layer.borderColor           = typeColor.CGColor;
    textField.layer.masksToBounds         = YES;
    textField.textColor                   = textColor == nil ? [UIColor blackColor] : textColor;
    textField.font                        = [UIFont systemFontOfSize:textFontSize];
    textField.keyboardType                = keyboardType;
    textField.secureTextEntry             = isEncrypt;
    textField.clearButtonMode             = UITextFieldViewModeWhileEditing;
    
    // 文字的间距
    textField.textAlignment               = NSTextAlignmentLeft;
    textField.leftViewMode                = UITextFieldViewModeAlways;
    UIView *view                          = [[UIView alloc] init];
    view.frame                            = CGRectMake(0, 0, 10, 0);
    textField.leftView                    = view;
    // placeholder
    NSMutableDictionary *attrs            = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = textColor;
    //    attrs[NSFontAttributeName]            = [UIFont systemFontOfSize:14];
    textField.attributedPlaceholder       = [[NSAttributedString alloc] initWithString:placeholder attributes:attrs];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpSetTextFieldImage:setBorderColor:setTextColor:setBorderWidth:setCornerRadius:setPlaceholder:setTextFontSize:setKeyboardType:setTextEncrypt:  ( 设置 textField <带左侧图片>  )
 *
 *  @ param  textField           textField
 *
 *  @ param  imageName           textField 图片名称
 *
 *  @ param  borderColor         textField 边框颜色
 *
 *  @ param  textColor           textField 文字颜色
 *
 *  @ param  borderWidth         textField 边框
 *
 *  @ param  cornerRadius        textField 圆角弧度
 *
 *  @ param  placeholder         textField 显示的提示
 *
 *  @ param  textFontSize        textField 文字大小
 *
 *  @ param  keyboardType        textField 键盘样式
 *
 *  @ param  isEncrypt           textField 是否是密码键盘
 */
+ (void)swpSetTextFieldImage:(UITextField *)textField setImageName:(NSString *)imageName setBorderColor:(UIColor *)borderColor setTextColor:(UIColor *)textColor setBorderWidth:(CGFloat)borderWidth setCornerRadius:(CGFloat)cornerRadius setPlaceholder:(NSString *)placeholder setTextFontSize:(CGFloat)textFontSize setKeyboardType:(UIKeyboardType)keyboardType setTextEncrypt:(BOOL)isEncrypt {

    UIColor  *typeColor                   =  borderColor == nil ? [UIColor blackColor] : borderColor;
    
    // 边框圆角
    textField.backgroundColor             = [UIColor whiteColor];
    textField.layer.borderWidth           = borderWidth;
    textField.layer.cornerRadius          = cornerRadius;
    textField.layer.borderColor           = typeColor.CGColor;
    textField.layer.masksToBounds         = YES;
    textField.textColor                   = textColor == nil ? [UIColor blackColor] : textColor;
    textField.font                        = [UIFont systemFontOfSize:textFontSize];
    textField.keyboardType                = keyboardType;
    textField.secureTextEntry             = isEncrypt;
    textField.clearButtonMode             = UITextFieldViewModeWhileEditing;
    
    // 文字的间距
    textField.textAlignment               = NSTextAlignmentLeft;
    textField.leftViewMode                = UITextFieldViewModeAlways;
    
    // 现在 textField 左侧显示 一张图
    UIImage     *image                    = [UIImage imageNamed:imageName];
    UIImageView *imageView                = [[UIImageView alloc] initWithImage:image];
    // 图片居中
    imageView.contentMode                 = UIViewContentModeCenter;
    UIView  *view                         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.frame                       = view.frame;
    [view addSubview:imageView];
    textField.leftView                    = view;
    
    // placeholder
    NSMutableDictionary *attrs            = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = textColor;
    //    attrs[NSFontAttributeName]            = [UIFont systemFontOfSize:14];
    textField.attributedPlaceholder       = [[NSAttributedString alloc] initWithString:placeholder attributes:attrs];
}


@end
