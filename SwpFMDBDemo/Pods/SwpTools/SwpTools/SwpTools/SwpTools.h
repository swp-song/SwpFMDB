//
//  SwpTools.h
//  swp_song
//
//  Created by songweiping on 15/12/28.
//  Copyright © 2015年 songweiping. All rights reserved.
//


#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@class WKWebView, UIWebView;

@class AppDelegate;

NS_ASSUME_NONNULL_BEGIN

#define SwpRefreshDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)

@interface SwpTools : NSObject


#pragma mark - Get System Version & App Version Methods

/**
 *  @author swp_song
 *
 *  @brief  swpToolCheckSystemVersion   ( 判断应用运行在什么系统版本上 )
 *
 *  @return 返回系统版本 ：7.0     6.0     6.1等
 */
+ (CGFloat)swpToolCheckSystemVersion;


/**
 *  @author swp_song
 *
 *  @brief  swpToolCheckAppVersion  ( 判断应用的版本号 )
 *
 *  @return NSString    ( 返回版本号 )
 */
+ (NSString *)swpToolCheckAppVersion;

/**
 *  @author swp_song
 *
 *  @brief  swpToolGetAppVersion    ( 获取 系统 版本号 < 无需自己判断 > )
 *
 *  @return NSString
 */
+ (NSString *)swpToolGetAppVersion;

/**
 *  @author swp_song
 *
 *  @brief  swpToolBundleVersion    ( 获取 系统 版本号 Production )
 *
 *  @return NSString
 */
+ (NSString *)swpToolBundleVersion;

/**
 *  @author swp_song
 *
 *  @brief  swpToolBundleShortVersionString ( 获取 系统 版本号 Development )
 *
 *  @return NSString
 */
+ (NSString *)swpToolBundleShortVersionString;


#pragma mark - Hiddle TableView Excessed Cell & Setting TableView Cell Separate Wire - Methods
/**
 *  @author swp_song
 *
 *  @brief  swpToolHiddleExcessedCellFromTableview: ( 隐藏 Tableivew 中多余的 Cell )
 *
 *  @param  tableview   tableview
 */
+ (void)swpToolHiddleExcessedCellFromTableview:(UITableView *)tableview;

/**
 *  @author swp_song
 *
 *  @brief  swpToolSetTableViewAllCellWire:setTableViewCell:    ( 设置 Cell 的分割线 )
 *
 *  @param  tableView   tableView
 *
 *  @param  cell        cell
 */
+ (void)swpToolSetTableViewAllCellWire:(UITableView *)tableView setTableViewCell:(UITableViewCell *)cell;

#pragma mark - WebView Load Servers URL Method
/**
 *  @author swp_song
 *
 *  @brief  swpToolWebViewLoadServersURL:setServersURLString:   ( WebView 加载 服务器端 URL )
 *
 *  @param  webView     webView
 *
 *  @param  URLString   URLString
 */
+ (void)swpToolWebViewLoadServersURL:(UIWebView *)webView setServersURLString:(NSString *)URLString;

/**
 *  @author swp_song
 *
 *  @brief  swpToolWKWebViewLoadServersURL:setServersURLString: ( WKWebView 加载 服务器端 URL )
 *
 *  @param  wkWebView   wkWebView
 *
 *  @param  URLString   URLString
 */
+ (void)swpToolWKWebViewLoadServersURL:(WKWebView *)wkWebView setServersURLString:(NSString *)URLString;


#pragma mark - Call Phone & Message - Methods
/**
 *  @author swp_song
 *
 *  @brief  swpToolCallPhone:superView:superView:   ( 拨打 电话 )
 *
 *  @param  phoneNumber                             ( 电话 号码 )
 *
 *  @param  view                                    ( 当前 控制 view )
 */
+ (void)swpToolCallPhone:(NSString *)phoneNumber superView:(UIView *)view;

/**
 *  @author swp_song
 *
 *  @brief  swpToolSendMessage: ( 快速跳转到 发送 信息页面 <只能给固定人发送信息, 不能编辑信息内容> )
 *
 *  @param  phoneNumber         ( 手机号 )
 */
+ (void)swpToolSendMessage:(NSString *)phoneNumber;

#pragma mark - Trim String Front And Back Blanker Methods
/**
 *  @author swp_song
 *
 *  @brief  swpToolTrimString:  ( 去除 字符串 前后 空格 )
 *
 *  @param  string              string
 *
 *  @return NSString
 */
+ (NSString *)swpToolTrimString:(NSString *)string;

#pragma mark - Set Button Timer Method
/**
 *  @author swp_song
 *
 *  @brief  swpToolSettingButtonTimer:setTimer: ( 在 button 设置倒计时 计时器 )
 *
 *  @param  button  button
 *
 *  @param  time    time
 */
+ (void)swpToolSetButtonTimer:(UIButton *)button setTimer:(int)time;
/**
 *  @author swp_song
 *
 *  @brief  swpToolSetButtonTimer:setTimer:appendTitle:     ( 在 button 设置倒计时计时器 )
 *
 *  @param  button      button
 *
 *  @param  timer       timer
 *
 *  @param  appendTitle appendTitle
 */
+ (void)swpToolSetButtonTimer:(UIButton *)button setTimer:(int)timer appendTitle:(NSString * _Nullable)appendTitle;

#pragma mark - Jump ViewController Method
/**
 *  @author swp_song
 *
 *  @brief  swpToolJumpContrillerWith:pushController:   ( Jump ViewController <跳转控制器 根据字符串实例化 控制器> )
 *
 *  @param  navigationController    navigationController
 *
 *  @param  controllerClass         controllerClass
 */
+ (void)swpToolJumpContrillerWith:(UINavigationController *)navigationController pushController:(NSString *)controllerClass;


#pragma mark - Check Page Method
/**
 *  @author swp_song
 *
 *  @brief  swpToolChekPageWithDataSource:page:firstPage:   ( Check page )
 *
 *  @param  dataSource          dataSource
 *
 *  @param  page                page
 *
 *  @param  firstPage           firstPage
 *
 *  @return NSMutableArrays
 */
+ (NSMutableArray *)swpToolChekPageWithDataSource:(NSMutableArray *)dataSource page:(NSInteger)page firstPage:(NSInteger)firstPage;

/**
 *  @author swp_song
 *
 *  @brief  swpToolSetLabelProperty:showBorderWidth:fontSize:fontColor: ( Setting Lable Property )
 *
 *  @param  label       label
 *
 *  @param  isShow      isShow
 *
 *  @param  fontSize    fontSize
 *
 *  @param  fontColor   fontColor
 */
+ (void)swpToolSetLabelProperty:(UILabel *)label showBorderWidth:(BOOL)isShow fontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor;

#pragma mark - Setting View UITapGestureRecognizer Method
/**
 *  @author swp_song
 *
 *  @brief  swpToolSetTapGestureRecognizer:setViewTag:setClickCount:setTarget:setAction:setCancelsTouchesInView:    ( 绑定 一个 点击事件 给一个 view )
 *
 *  @param  view        view
 *
 *  @param  tag         tag
 *
 *  @param  count       count
 *
 *  @param  target      target
 *
 *  @param  action      action
 *
 *  @param  cancels     cancels
 *
 *  @return UITapGestureRecognizer
 */
+ (UITapGestureRecognizer *)swpToolSetTapGestureRecognizer:(UIView *)view setViewTag:(NSInteger)tag setClickCount:(NSInteger)count setTarget:(nullable id)target setAction:(nullable SEL)action setCancelsTouchesInView:(BOOL)cancels;




#pragma - mark Delete Sandbox File Method
/**
 *  @author swp_song
 *
 *  @brief  swpToolDeleteFileWithFileName:  ( Delete Sandbox File )
 *
 *  @param  fileName    fileName
 *
 *  @return BOOL
 */
+ (BOOL)swpToolDeleteFileWithFileName:(NSString *)fileName;

#pragma mark - Image Compress Methods
/**
 *  @author swp_song
 *
 *  @brief  swpToolCompressImage:scaleToSize:   ( Image Compress Methods <图片 压缩> )
 *
 *  @param  image       image
 *
 *  @param  size        size
 *
 *  @return UIImage
 */
+ (UIImage *)swpToolCompressImage:(UIImage *)image scaleToSize:(CGSize)size;


#pragma mark - Data Save Plist & Get Plist Data - Methods
/**
 *  @author swp_song
 *
 *  @brief  swpToolDataWriteToPlist:plistName:  ( 将 数据写入 plist 文件中 )
 *
 *  @param  writeData                写入数据
 *
 *  @param  plistName                plist 文件名称
 *
 *  @return BOOL                     写入 成功 返回 YES 写入失败 返回 NO
 */
+ (BOOL)swpToolDataWriteToPlist:(NSDictionary*)writeData plistName:(nullable NSString *)plistName SwpRefreshDeprecated("废弃方法, 请勿使用");

/**
 *  @author swp_song
 *
 *  @brief  swpToolGetDictionaryFromPlist:  ( 取出 plist 文件中数据 返回一个字典 )
 *
 *  @param  plistName                       plist 文件名称
 *
 *  @return NSDictionary                    返回 取出的数据 字典
 */
+ (NSDictionary *)swpToolGetDictionaryFromPlist:(nullable NSString *)plistName SwpRefreshDeprecated("废弃方法, 请勿使用");

/**
 *  @author swp_song
 *
 *  @brief  swpToolGetInterfaceURL: ( 取出 主接口 接口 URL )
 *
 *  @param  key                     ( url key )
 *
 *  @return NSString                ( url )
 */
+ (NSString *)swpToolGetInterfaceURL:(nullable NSString *)key SwpRefreshDeprecated("废弃方法, 请勿使用");

#pragma mark - Tools Methods
/**
 *  @author swp_song
 *
 *  @brief  swpToolScreenWidth  ( 取出 设备 实际的宽度值 )
 *
 *  @return CGFloat
 */
+ (CGFloat)swpToolScreenWidth;

/**
 *  @author swp_song
 *
 *  @brief  swpToolScreenHeight ( 取出 设备 实际的高度值 )
 *
 *  @return CGFloat
 */
+ (CGFloat)swpToolScreenHeight;

/**
 *  @author swp_song
 *
 *  @brief  swpToolScreenSize   ( 取出 设备 实际的宽高 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolScreenSize;

/**
 *  @author swp_song
 *
 *  @brief  swpToolScreenScale:swpToolScreenScale:scaleWidth:scaleHeight:   ( 计算 宽高比 )
 *
 *  @param  screenWidth         ( 固定 宽度 或 高度 )
 *
 *  @param  scaleWidth          比例值  (2:1 <2为该参数> )
 *
 *  @param  scaleHeight         比例值  (2:1 <1为该参数> )
 *
 *  @return CGFloat
 */
+ (CGFloat)swpToolScreenScale:(CGFloat)screenWidth scaleWidth:(CGFloat)scaleWidth scaleHeight:(CGFloat)scaleHeight;

/**
 *  @author swp_song
 *
 *  @brief  swpToolIphone4sScreenSize   ( 获取 4 / 4s 屏幕尺寸 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolIphone4sScreenSize;

/**
 *  @author swp_song
 *
 *  @brief  swpToolIphone5sScreenSize   ( 获取 5 / 5s 屏幕尺寸 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolIphone5sScreenSize;

/**
 *  @author swp_song
 *
 *  @brief  swpToolIphone6sScreenSize   ( 获取 6 / 6s 屏幕尺寸 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolIphone6sScreenSize;

/**
 *  @author swp_song
 *
 *  @brief  swpToolIphone6pScreenSize   ( 获取 6p / 6ps 屏幕尺寸 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolIphone6pScreenSize;

#pragma mark - Get Application Delegate Method
/**
 *  @author swp_song
 *
 *  @brief  swpToolApplicationDelegate  ( 获取工 AppDelegat 代理 )
 *
 *  @return AppDelegate
 */
+ (AppDelegate *)swpToolApplicationDelegate;

#pragma mark - Check Existence Controller
/**
 *  @author swp_song
 *
 *  @brief  swpToolCheckNavigationControllerExistenceController:checkController:checkResult:checkResult ( 验证 导航控制器 中 是否存在 指定 控制器 )
 *
 *  @param  navigationController    navigationController
 *
 *  @param  checkController         checkController
 *
 *  @param  checkResult             checkResult
 */
+ (void)swpToolCheckNavigationControllerExistenceController:(UINavigationController *)navigationController checkController:(Class)checkController checkResult:(void(^)(id obj, UINavigationController *navigationController, BOOL * _Nonnull stop))checkResult;

/**
 *  @author swp_song
 *
 *  @brief  swpToolValidationClassTypeWithObject:validationClass:   ( 验证 2个 类 是否 是同一个类 )
 *
 *  @param  object              object
 *
 *  @param  validationClass     validationClass
 *
 *  @return BOOL
 */
+ (BOOL)swpToolValidationClassTypeWithObject:(NSObject *)object validationClass:(Class)validationClass;

/**
 *  @author swp_song
 *
 *  @brief  swpToolValidationClassTypeWithDataSource:validationClass:   ( 验证两个类是否是同一个类 )
 *
 *  @param  objects             objects
 *
 *  @param  validationClass     validationClass
 *
 *  @return BOOL
 */
+ (BOOL)swpToolValidationClassTypeWithDataSource:(NSArray<NSObject *> *)objects validationClass:(Class)validationClass;

#pragma mark -
/**
 *  @author swp_song
 *
 *  @brief  swpToolViewBottomDrawLines:linesColor:  ( 在 view 底部画线 在 view drawRect 这个方法中调用, 一般适用于 绘制 cell 分割线)
 *
 *  @param  frame       frame
 *
 *  @param  color       color
 */
+ (void)swpToolViewBottomDrawLines:(CGRect)frame linesColor:(UIColor *)color;

/**
 *  @author swp_song
 *
 *  @brief  swpToolViewBottomDrawLines:linesHeight:linesColor:  ( 在 view 底部画线在 view drawRect 这个方法中调用, 一般适用于 绘制 cell 分割线)
 *
 *  @param  frame   frame
 *
 *  @param  height  height
 *
 *  @param  color   color
 */
+ (void)swpToolViewBottomDrawLines:(CGRect)frame linesHeight:(CGFloat)height linesColor:(UIColor *)color;


#pragma mark - Calculate String Size
/**
 *  @author swp_song
 *
 *  @brief  swpToolCalculateRowHeight:font:width:   ( 根据字符串的宽度, 计算字符串的高度 )
 *
 *  @param  string  string
 *
 *  @param  font    font
 *
 *  @param  width   width
 *
 *  @return CGFloat
 */
+ (CGFloat)swpToolCalculateRowHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width;

/**
 *  @author swp_song
 *
 *  @brief  swpToolCalculateRowWidth:font:height:   ( 根据字符串的高度, 计算字符串的宽度 )
 *
 *  @param  string  string
 *
 *  @param  font    font
 *
 *  @param  height  height
 *
 *  @return CGFloat
 */
+ (CGFloat)swpToolCalculateRowWidth:(NSString *)string font:(UIFont *)font height:(CGFloat)height;


/**
 *  @author swp_song
 *
 *  @brief  swpToolCharacterStringContainsEmoji:    ( 验证字符串中是否含有 < Emoji > )
 *
 *  @param  string  string
 *
 *  @return BOOL
 */
+ (BOOL)swpToolCharacterStringContainsEmoji:(NSString *)string;


@end

NS_ASSUME_NONNULL_END
