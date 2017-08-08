//
//  SwpTools.m
//  swp_song
//
//  Created by songweiping on 15/12/28.
//  Copyright © 2015年 songweiping. All rights reserved.
//

#import "SwpTools.h"

@class AppDelegate;

static NSString * const defaultPlistName = @"mainInterfaceData.plist";

@implementation SwpTools


#pragma mark - Get System Version & App Version Methods

/**!
 *  @author swp_song, 2015-12-28 14:43:54
 *
 *  @brief  swpToolCheckSystemVersion   ( 判断应用运行在什么系统版本上 )
 *
 *  @return 返回系统版本 ：7.0     6.0     6.1等
 */
+ (CGFloat)swpToolCheckSystemVersion {
    static dispatch_once_t onceToken;
    __block float systemVersion = 0;
    dispatch_once(&onceToken, ^{
        systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    });
    return systemVersion;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolCheckAppVersion  ( 判断应用的版本号 )
 *
 *  @return NSString    ( 返回版本号 )
 */
+ (NSString *)swpToolCheckAppVersion {
    static dispatch_once_t onceToken;
    __block NSString *APPVersion = 0;
    dispatch_once(&onceToken, ^{
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        APPVersion             = [infoDict objectForKey:@"CFBundleVersion"];
    });
    return APPVersion;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolGetAppVersion   ( 获取 系统 版本号 < 无需自己判断 > )
 *
 *  @return NSString
 */
+ (NSString *)swpToolGetAppVersion {
#if DEBUG
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
#else
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
#endif
    
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolBundleVersion   ( 获取 系统 版本号 Production )
 *
 *  @return NSString
 */
+ (NSString *)swpToolBundleVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolBundleShortVersionString   ( 获取 系统 版本号 Development )
 *
 *  @return NSString
 */
+ (NSString *)swpToolBundleShortVersionString {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}



#pragma mark - Hiddle TableView Excessed Cell & Setting TableView Cell Separate Wire - Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpToolHiddleExcessedCellFromTableview: ( 隐藏 Tableivew 中多余的 Cell )
 *
 *  @param  tableview   tableview
 */
+ (void)swpToolHiddleExcessedCellFromTableview:(UITableView *)tableview {
    UIView *view         = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor clearColor];
    [tableview setTableFooterView:view];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolSetTableViewAllCellWire:setTableViewCell:  ( 设置 Cell 的分割线 )
 *
 *  @param  tableView   tableView
 *
 *  @param  cell        cell
 */
+ (void)swpToolSetTableViewAllCellWire:(UITableView *)tableView setTableViewCell:(UITableViewCell *)cell {
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset :UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins  :UIEdgeInsetsZero];
    }
}


#pragma mark - WebView Load Servers URL Method
/**!
 *  @author swp_song
 *
 *  @brief  swpToolWebViewLoadServersURL:setServersURLString:    ( WebView 加载 服务器端 URL )
 *
 *  @param  webView     webView
 *
 *  @param  URLString   URLString
 */
+ (void)swpToolWebViewLoadServersURL:(UIWebView *)webView setServersURLString:(NSString *)URLString {
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]]];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolWKWebViewLoadServersURL:setServersURLString: ( WKWebView 加载 服务器端 URL )
 *
 *  @param  wkWebView   wkWebView
 *
 *  @param  URLString   URLString
 */
+ (void)swpToolWKWebViewLoadServersURL:(WKWebView *)wkWebView setServersURLString:(NSString *)URLString {
    [wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]]];
}

#pragma mark - Call Phone & Message - Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpToolCallPhone:superView:superView:   ( 拨打 电话 )
 *
 *  @param  phoneNumber                             ( 电话 号码 )
 *
 *  @param  view                                    ( 当前 控制 view )
 */
+ (void)swpToolCallPhone:(NSString *)phoneNumber superView:(UIView *)view {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSURL     *url     = [NSURL URLWithString:[@"tel://" stringByAppendingString:phoneNumber]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [view addSubview:webView];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpToolSendMessage: ( 快速跳转到 发送 信息页面 <只能给固定人发送信息, 不能编辑信息内容> )
 *
 *  @param  phoneNumber         ( 手机号 )
 */
+ (void)swpToolSendMessage:(NSString *)phoneNumber {
    NSString *sms = [NSString stringWithFormat:@"sms://%@", phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:sms]];
}


#pragma mark - Trim String Front And Back Blanker Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpToolTrimString:  ( 去除 字符串 前后 空格 )
 *
 *  @param  string              string
 *
 *  @return NSString
 */
+ (NSString *)swpToolTrimString:(NSString *)string {
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}


#pragma mark - Set Button Timer Method
/**!
 *  @author swp_song
 *
 *  @brief  swpToolSettingButtonTimer:setTimer: ( 在 button 设置倒计时 计时器 )
 *
 *  @param  button  button
 *
 *  @param  timer   time
 */
+ (void)swpToolSetButtonTimer:(UIButton *)button setTimer:(int)timer {
    [self.class swpToolSetButtonTimer:button setTimer:timer appendTitle:@"秒后重发"];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolSetButtonTimer:setTimer:appendTitle: ( 在 button 设置倒计时计时器 )
 *
 *  @param  button      button
 *
 *  @param  timer       timer
 *
 *  @param  appendTitle appendTitle
 */
+ (void)swpToolSetButtonTimer:(UIButton *)button setTimer:(int)timer appendTitle:(NSString *)appendTitle {
    
    NSString *title          = button.titleLabel.text;
    button.enabled           = YES;
    __block int timeout      = timer;
    dispatch_queue_t queue   = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){
            //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [button setTitle:title forState:UIControlStateNormal];
                button.userInteractionEnabled = YES;
            });
        } else {
            // int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [button setTitle:[NSString stringWithFormat:@"%@%@", strTime, appendTitle] forState:UIControlStateNormal];
                button.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark - Jump ViewController Method
/**!
 *  @author swp_song
 *
 *  @brief  swpToolJumpContrillerWith:pushController:   ( Jump ViewController <跳转控制器 根据字符串实例化 控制器> )
 *
 *  @param  navigationController    navigationController
 *
 *  @param  controllerClass         controllerClass
 */
+ (void)swpToolJumpContrillerWith:(UINavigationController *)navigationController pushController:(NSString *)controllerClass {
    [navigationController pushViewController:[[[NSClassFromString(controllerClass) class] alloc] init] animated:YES];
}

#pragma mark - Check Page Method
/**!
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
 *  @return NSMutableArray
 */
+ (NSMutableArray *)swpToolChekPageWithDataSource:(NSMutableArray *)dataSource page:(NSInteger)page firstPage:(NSInteger)firstPage {
    
    NSMutableArray *array = [NSMutableArray array];
    if (page != firstPage) {
        array = dataSource;
    }
    return array;
}

/**!
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
+ (void)swpToolSetLabelProperty:(UILabel *)label showBorderWidth:(BOOL)isShow fontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor {
    
    if (isShow) {
        label.layer.borderWidth = 1;
    }
    label.font              = [UIFont systemFontOfSize:fontSize];
    label.textColor         = fontColor;
}

#pragma mark - Set View UITapGestureRecognizer Method
/**!
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
+ (UITapGestureRecognizer *)swpToolSetTapGestureRecognizer:(UIView *)view setViewTag:(NSInteger)tag setClickCount:(NSInteger)count setTarget:(id)target setAction:(SEL)action setCancelsTouchesInView:(BOOL)cancels {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired    = count;
    tap.cancelsTouchesInView    = cancels;
    view.tag                    = tag;
    [tap addTarget:target action:action];
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:tap];
    return tap;
}


#pragma - mark Delete Sandbox File Method
/**!
 *  @author swp_song
 *
 *  @brief  swpToolDeleteFileWithFileName:  ( Delete Sandbox File )
 *
 *  @param  fileName    fileName
 *
 *  @return BOOL
 */
+ (BOOL)swpToolDeleteFileWithFileName:(NSString *)fileName {
    
    // File Manager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // if file exist !
    BOOL          fileBeing    = [[NSFileManager defaultManager] fileExistsAtPath:fileName];
    
    if (!fileBeing) {
        NSLog(@"file not exist !");
        return NO;
    } else {
        NSLog(@"file exist !");
        
        if ([fileManager removeItemAtPath:fileName error:nil]) {
            NSLog(@"Delete File Success !");
            return YES;
        } else {
            NSLog(@"Delete File Error !");
            return NO;
        }
    }
}

#pragma mark - Image Compress Methods
/**!
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
+ (UIImage *)swpToolCompressImage:(UIImage *)image scaleToSize:(CGSize)size {
    
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGFloat     compression     = 0.5f;
    CGFloat     maxCompression  = 0.1f;
    NSUInteger  maxLength       = 1024 * 200;
    
    NSData     *imageData       = UIImageJPEGRepresentation(scaledImage, compression);
    while (imageData.length > maxLength && compression > maxCompression) {
        compression -= 0.1;
        imageData   =  UIImageJPEGRepresentation(scaledImage, compression);
    };
    
    return [UIImage imageWithData:imageData];
}

#pragma mark - Data Save Plist & Get Plist Data - Methods
/**!
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
+ (BOOL)swpToolDataWriteToPlist:(NSDictionary*)writeData plistName:(nullable NSString *)plistName {

    // 建立文件管理
    NSFileManager *fm        = [NSFileManager defaultManager];

    // 找到Documents文件所在的路径
    NSArray       *path      = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"path=%@",path);

    // 取得第一个Documents文件夹的路径
    NSString      *filePath = [path objectAtIndex:0];
    
    // 默认路径
    plistName               = plistName == nil ? defaultPlistName : plistName;
   
    // 把TestPlist文件加入
    NSString      *plistPath = [filePath stringByAppendingPathComponent:plistName];
    
    if ([fm fileExistsAtPath:plistPath]) {
        NSLog(@"文件已存在,开始删除源文件");
        //修改文件内容
        if ([fm removeItemAtPath:plistPath error:nil]) {
            NSLog(@"文件删除成功");
            //开始创建文件
            if ([fm createFileAtPath:plistPath contents:nil attributes:nil]) {
                NSLog(@"文件创建成功,开始写入数据");
                if ([writeData writeToFile:plistPath atomically:YES]) {
                    return YES;
                }
            } else {
                NSLog(@"文件创建失败");
                return NO;
            }
        } else {
            NSLog(@"文件删除失败");
            return NO;
        }
        
    } else {
        //开始创建文件
        if ([fm createFileAtPath:plistPath contents:nil attributes:nil]) {
            NSLog(@"文件创建成功,开始写入数据");
            if ([writeData writeToFile:plistPath atomically:YES]) {
                return YES;
            }
        } else {
            NSLog(@"文件创建失败,尝试重新获取接口数据");
            return NO;
        }
    }
    return NO;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolGetDictionaryFromPlist:  ( 取出 plist 文件中数据 返回一个字典 )
 *
 *  @param  plistName                       plist 文件名称
 *
 *  @return NSDictionary                    返回 取出的数据 字典
 */
+ (NSDictionary *)swpToolGetDictionaryFromPlist:(nullable NSString *)plistName {
    // 默认路径
    plistName                = plistName == nil ? defaultPlistName : plistName;
    //建立文件管理
    NSFileManager *fm        = [NSFileManager defaultManager];
    //找到Documents文件所在的路径
    NSArray       *path      = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

    //取得第一个Documents文件夹的路径
//    NSString      *filePath  = [path objectAtIndex:0];
    NSString      *filePath  = [path firstObject];

    //把TestPlist文件加入
    NSString      *plistPath = [filePath stringByAppendingPathComponent:plistName];
    
    if ([fm fileExistsAtPath:plistPath]) {
        NSLog(@"plist文件已找到,返回各个文件接口");
        return [NSDictionary dictionaryWithContentsOfFile:plistPath];
    } else {
        NSLog(@"plist文件未找到");
        return nil;
    }
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolGetInterfaceURL: ( 取出 主接口 接口 URL )
 *
 *  @param  key                     ( url key )
 *
 *  @return NSString                ( url )
 */
+ (NSString *)swpToolGetInterfaceURL:(nullable NSString *)key {
    NSString *interfaceURL = [[[[SwpTools swpToolGetDictionaryFromPlist:nil] objectForKey:@"obj"] objectForKey:@"api"] objectForKey:key];
    interfaceURL           = interfaceURL == nil ? @"" : interfaceURL;
    return interfaceURL;
}

#pragma mark - About Screen Size Tools Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpToolScreenWidth  ( 取出 设备 实际的宽度值 )
 *
 *  @return CGFloat
 */
+ (CGFloat)swpToolScreenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolScreenHeight ( 取出 设备 实际的高度值 )
 *
 *  @return CGFloat
 */
+ (CGFloat)swpToolScreenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolScreenSize   ( 取出 设备 实际的宽高 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolScreenSize {
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
}

/**!
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
+ (CGFloat)swpToolScreenScale:(CGFloat)screenWidth scaleWidth:(CGFloat)scaleWidth scaleHeight:(CGFloat)scaleHeight {
    return screenWidth / scaleWidth * scaleHeight;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolIphone4sScreenSize   ( 获取 4 / 4s 屏幕尺寸 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolIphone4sScreenSize {
    return CGSizeMake(320, 480);
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolIphone5sScreenSize   ( 获取 5 / 5s 屏幕尺寸 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolIphone5sScreenSize {
    return CGSizeMake(320, 568);
}


/**!
 *  @author swp_song
 *
 *  @brief  swpToolIphone6sScreenSize   ( 获取 6 / 6s 屏幕尺寸 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolIphone6sScreenSize {
    return CGSizeMake(375, 667);
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolIphone6pScreenSize   ( 获取 6p / 6ps 屏幕尺寸 )
 *
 *  @return CGSize
 */
+ (CGSize)swpToolIphone6pScreenSize {
    return CGSizeMake(414, 736);
}

#pragma mark - Get Application Delegate Method
/**!
 *  @author swp_song
 *
 *  @brief  swpToolApplicationDelegate  ( 获取工 AppDelegat 代理 )
 *
 *  @return AppDelegate
 */
+ (AppDelegate *)swpToolApplicationDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark - Check Existence Controller
/**!
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
+ (void)swpToolCheckNavigationControllerExistenceController:(UINavigationController *)navigationController checkController:(Class) checkController checkResult:(void(^)(id obj, UINavigationController *navigationController, BOOL * _Nonnull stop))checkResult {
    [navigationController.viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[checkController class]]) {
            *stop = YES;
            checkResult(obj, navigationController, stop);
        }
    }];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpToolValidationClassTypeWithObject:validationClass:   ( 验证两个类是否是同一个类 )
 *
 *  @param  object              object
 *
 *  @param  validationClass     validationClass
 *
 *  @return BOOL
 */
+ (BOOL)swpToolValidationClassTypeWithObject:(NSObject *)object validationClass:(Class)validationClass {
    
    if ([object isKindOfClass:validationClass]) {
        return YES;
    }
    
    return NO;
}

/**!
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
+ (BOOL)swpToolValidationClassTypeWithDataSource:(NSArray<NSObject *> *)objects validationClass:(Class)validationClass {
    __block BOOL results = NO;
    [objects enumerateObjectsUsingBlock:^(NSObject * _Nonnull object, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([object isKindOfClass:validationClass]) {
            *stop   = YES;
            results = YES;
        }
    }];
    return results;
}



/**!
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
+ (void)swpToolViewBottomDrawLines:(CGRect)frame linesHeight:(CGFloat)height linesColor:(UIColor *)color {
    
    color = color ? color : [UIColor colorWithRed:0xE2 / 255.0f green:0xE2 / 255.0f blue:0xE2 / 255.0f alpha:1];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, frame);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokeRect(context, CGRectMake(0, frame.size.height - height, frame.size.width, height));
}


/**!
 *  @author swp_song
 *
 *  @brief  swpToolViewBottomDrawLines:linesColor:  ( 在 view 底部画线 在 view drawRect 这个方法中调用, 一般适用于 绘制 cell 分割线)
 *
 *  @param  frame       frame
 *
 *  @param  color       color
 */
+ (void)swpToolViewBottomDrawLines:(CGRect)frame linesColor:(UIColor *)color {
    [[self class] swpToolViewBottomDrawLines:frame linesHeight:1 linesColor:color];
}

#pragma mark - Calculate String Size
/**!
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
+ (CGFloat)swpToolCalculateRowHeight:(NSString *)string font:(UIFont *)font width:(CGFloat)width {
    
    //  指定字号
    NSDictionary *dictionary = @{NSFontAttributeName : font};
    //  计算高度要先指定宽度
    CGRect       rect        = [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin |
                                NSStringDrawingUsesFontLeading attributes:dictionary context:nil];
    return rect.size.height;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolCalculateRowWidth:font:height:       ( 根据字符串的高度, 计算字符串的宽度 )
 *
 *  @param  string  string
 *
 *  @param  font    font
 *
 *  @param  height  height
 *
 *  @return CGFloat
 */
+ (CGFloat)swpToolCalculateRowWidth:(NSString *)string font:(UIFont *)font height:(CGFloat)height {
    
    //  指定字号
    NSDictionary *dictionary = @{NSFontAttributeName : font};
    //  计算高度要先指定高度
    CGRect       rect        = [string boundingRectWithSize:CGSizeMake(0, height) options:NSStringDrawingUsesLineFragmentOrigin |
                                NSStringDrawingUsesFontLeading attributes:dictionary context:nil];
    return rect.size.width;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpToolCharacterStringContainsEmoji:    ( 验证字符串中是否含有 < Emoji > )
 *
 *  @param  string  string
 *
 *  @return BOOL
 */
+ (BOOL)swpToolCharacterStringContainsEmoji:(NSString *)string {
    
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])  options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    
    return returnValue;
}




#pragma mark - Order Error & Order Test - Method
/**!
 *  设置导航控制器 搜索条
 *
 *  @param  searchBarWidth searchBar 宽度
 *  @param  searchBarColor searchBar 背景颜色
 *  @param  tag            searchBar tag
 *  @param  imageX         searchBar 图片的X的值
 *  @param  image          searchBar 显示的图片
 *  @param  titleWidth     searchBar 文字的宽度
 *  @param  fontSize       searchBar 文字的大小
 *  @param  fontColor      searchBar 文字的颜色
 *  @param  title          searchBar 显示的文字
 *
 *  @return UIView
 */
+ (UIView *)settingNavSearchBarWidth:(CGFloat)searchBarWidth backgroundColor:(UIColor *)searchBarColor searchBarTag:(NSInteger)tag searchImageX:(CGFloat)imageX searchImage:(NSString *)image  searchTitleWidth:(CGFloat)titleWidth searchTitleFontSize:(CGFloat)fontSize searchTitleFontColor:(UIColor *)fontColor searchTitle:(NSString *)title  {
    
    
    UIView  *searchBar              = [[UIView alloc] init];
    searchBar.frame                 = CGRectMake(0, 0, searchBarWidth, 30);
    searchBar.backgroundColor       = searchBarColor;
    searchBar.tag                   = tag;
    searchBar.layer.cornerRadius    = 5.0;
    searchBar.layer.masksToBounds   = YES;
    
    UIImageView *searchImageView    = [[UIImageView alloc] init];
    CGFloat searchImageViewX        = imageX;
    CGFloat searchImageViewW        = searchBar.frame.size.height;
    CGFloat searchImageViewH        = searchBar.frame.size.height;
    searchImageView.frame           = CGRectMake(searchImageViewX, 0, searchImageViewW, searchImageViewH);
    searchImageView.image              = [UIImage imageNamed:image];
    searchImageView.layer.borderColor  = [UIColor redColor].CGColor;
    //    searchImageView.layer.borderWidth  = 1;
    //    searchImageView.contentMode        = UIViewContentModeCenter;
    [searchBar addSubview:searchImageView];
    
    
    UILabel *searchTitleView        = [[UILabel alloc] init];
    CGFloat searchTitleViewX        = CGRectGetMaxX(searchImageView.frame) + 3;
    CGFloat searchTitleViewW        = titleWidth;
    CGFloat searchTitleViewH        = searchImageViewH;
    searchTitleView.frame           = CGRectMake(searchTitleViewX, 0, searchTitleViewW, searchTitleViewH);
    searchTitleView.backgroundColor = [UIColor clearColor];
    searchTitleView.text            = title;
    searchTitleView.font            = [UIFont systemFontOfSize:fontSize];
    searchTitleView.textColor       = fontColor;
    [searchBar addSubview:searchTitleView];
    
    return searchBar;
}

- (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize {
    
    // Create a graphics image context
    
    UIGraphicsBeginImageContext (newSize);
    
    // Tell the old image to draw in this new context, with the desired
    
    // new size
    
    [image drawInRect : CGRectMake (0 , 0, newSize.width, newSize.height)];
    // Get the new image from the context
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext ();
    // End the context
    
    UIGraphicsEndImageContext ();
    
    // Return the new image.
    return newImage;
    
    //    NSDictionary *dict1 = @{
    //                            @"aaa" : @"111",
    //                            @"bbb" : @"222",
    //                            };
    //    //
    //    NSData      *jsonData1 = [NSJSONSerialization dataWithJSONObject:dict1 options:NSJSONWritingPrettyPrinted error:nil];
    //    NSString    *json1     =  [[NSString alloc] initWithData:jsonData1 encoding:NSUTF8StringEncoding];
    //    NSLog(@"%@", json1);
    
}




@end
