//
//  UITextField+SwpSetTextField.h
//  swp_song
//
//  Created by swp_song on 16/6/3.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UITextField (SwpSetTextField)

/**!
 *  @author swp_song
 *
 *  @ brief  swpSetTextFieldStyle:setBorderColor:setTextColor:setBorderWidth:setCornerRadius:setPlaceholder:setTextFontSize:setKeyboardType:setTextEncrypt: ( 设置 textField <没有左侧图片> )
 *
 *  @param  textField           textField
 *
 *  @param  borderColor         textField 边框颜色
 *
 *  @param  textColor           textField 文字颜色
 *
 *  @param  borderWidth         textField 边框
 *
 *  @param  cornerRadius        textField 圆角弧度
 *
 *  @param  placeholder         textField 显示的提示
 *
 *  @param  textFontSize        textField 文字大小
 *
 *  @param  keyboardType        textField 键盘样式
 *
 *  @param  isEncrypt           textField 是否是密码键盘
 */
+ (void)swpSetTextFieldStyle:(UITextField *)textField setBorderColor:(nullable UIColor *)borderColor setTextColor:(nullable UIColor *)textColor setBorderWidth:(CGFloat)borderWidth setCornerRadius:(CGFloat)cornerRadius setPlaceholder:(NSString *)placeholder setTextFontSize:(CGFloat)textFontSize   setKeyboardType:(UIKeyboardType)keyboardType setTextEncrypt:(BOOL)isEncrypt;

/**!
 *  @author swp_song
 *
 *  @ brief  swpSetTextFieldImage:setBorderColor:setTextColor:setBorderWidth:setCornerRadius:setPlaceholder:setTextFontSize:setKeyboardType:setTextEncrypt: ( 设置 textField <带左侧图片>  )
 *
 *  @param  textField           textField
 *
 *  @param  imageName           textField 图片名称
 *
 *  @param  borderColor         textField 边框颜色
 *
 *  @param  textColor           textField 文字颜色
 *
 *  @param  borderWidth         textField 边框
 *
 *  @param  cornerRadius        textField 圆角弧度
 *
 *  @param  placeholder         textField 显示的提示
 *
 *  @param  textFontSize        textField 文字大小
 *
 *  @param  keyboardType        textField 键盘样式
 *
 *  @param  isEncrypt           textField 是否是密码键盘
 */
+ (void)swpSetTextFieldImage:(UITextField *)textField setImageName:(NSString *)imageName setBorderColor:(nullable UIColor *)borderColor setTextColor:(nullable UIColor *)textColor setBorderWidth:(CGFloat)borderWidth setCornerRadius:(CGFloat)cornerRadius setPlaceholder:(NSString *)placeholder setTextFontSize:(CGFloat)textFontSize setKeyboardType:(UIKeyboardType)keyboardType setTextEncrypt:(BOOL)isEncrypt;

@end
NS_ASSUME_NONNULL_END
