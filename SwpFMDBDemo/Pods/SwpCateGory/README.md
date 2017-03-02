# SwpCateGory

##### 封装 分类 常用一些工具
---
##### 导入：
```
手动导入：

SwpCateGory 文件夹 导入 项目 中

引入需要用的分类 :

#import "UIColor+SwpColor.h"
```
---

```ruby

CocoaPods 导入:

pod search SwpCateGory

pod 'SwpCateGory'

#import <SwpCateGory/UIColor+SwpColor.h>

```
---

##### 介绍:

```Objective-C

// 颜色 一些操作
#import <SwpCateGory/UIColor+SwpColor.h>   

// View fram 属性一些操作
#import <SwpCateGory/UIView+SwpExtension.h>  

// 快速设置 TextField 一些常用的属性
#import <SwpCateGory/UITextField+SwpSetTextField.h>  

// 快速设置 button 一些常用的样式
#import <SwpCateGory/UIButton+SwpSetButton.h>     

// 快速设置 barButtonItem 一些常用的样式
#import <SwpCateGory/UIBarButtonItem+SwpSetNavigationBarItem.h>

// 简单对 userDefaults 操作
#import <SwpCateGory/NSUserDefaults+SwpUserDefaults.h>

// 字体常用方法封装
#import <SwpCateGory/UIFont+SwpFont.h>

// Attributed 分类 快速 设置 Attributed 字体, 颜色
#import <SwpCateGory/SwpAttributedHeader.h>

// 新增 字典 分类
#import <SwpCateGory/NSDictionary+SwpGenerateProperty.h>
```

---

##### 1.2.0 更新:
```Objective-C
  1. 2016-11-24

  2. 更新 字典 一个分类, < 根据 后台 json 自动创建 属性打印 >

```
---

##### 1.1.2 更新:
```Objective-C
  1. 2016-11-24

  2. 修复一些备注 信息

```

---
##### 1.0.8 更新:
```Objective-C
  修复一些BUG
```

---
##### 1.0.7 更新:
```Objective-C

  新增 UIImage CateGory 分类, 生成 二维码 Or 条形码

  1. UIImage+SwpQrCodeImage.h  ---> 生成二维码
  2. UIImage+SwpBarCodeImage.h ---> 生成条形码

  代码:
  1. 二维码:
  UIImage *image = [UIImage swpQrCodeImageWithString:@"http://swp-song.github.io" size:500];

  2. 条形码:
  UIImage *image = [UIImage swpBarCodeImageCreateWithString:@"66612663612631" size:CGSizeMake(300, 60)];
  .... 详细 请见 代码

```

---
##### 1.0.6 更新:
```Objective-C

  新增 Attributed 分类
  #import "SwpAttributedHeader.h"

  // 设置 字体
  SwpAttributedFont *swpAttributedFont       = [SwpAttributedFont new];
  swpAttributedFont.swpAttributedFont        = [UIFont swpFontHeitiSCWithFontSize:16.f];
  swpAttributedFont.swpAttributedEffectRange = NSMakeRange(0, richString.length);
  [richString addStringAttribute:swpAttributedFont];

  // 设置 颜色
  SwpAttributedColor *swpAttributedColor      = [SwpAttributedColor new];
  swpAttributedColor.swpAttributedColor       = [[UIColor blackColor] colorWithAlphaComponent:0.65f];
  swpAttributedColor.swpAttributedEffectRange = NSMakeRange(0, richString.length);
  [richString addStringAttribute:swpAttributedColor];



  .... 详细 请见 代码

```
---
##### 1.0.5 更新:
```Objective-C

  新增 字体 分类
  #import "UIFont+SwpFont.h"


  加载 系统 字体

  + (UIFont *)swpFontAppleSDGothicNeoThinWithFontSize:(CGFloat)size;

  .... 详细 请见 代码

```
---

##### 1.0.4 更新:
```Objective-C
  UIButton+SwpSetButton.h 分类中

  方法:

  + (UIButton *)swpSetNavigationButtonWithTitle:(NSString *)title setFontColot:(UIColor *)fontColot setFontSize:(CGFloat)fontSize setTag:(NSInteger)tag setLeftButton:(BOOL)leftBarButton setTarget:(id)target setAction:(SEL)action;

  替换成:

  + (UIButton *)swpSetNavigationButtonWithTitle:(NSString *)title setFontColot:(UIColor *)fontColot setFontSize:(CGFloat)fontSize setTag:(NSInteger)tag setLeftButton:(BOOL)leftBarButton setTarget:(nullable id)target setAction:(nullable SEL)action;

```
---

##### 1.0.3 更新 :
```Objective-C
// 字符串 16 进制 颜色 设置 颜色  ( 0XF4B711 or 0xF4B711 or #F4B711 )
+ (UIColor *)swpColorWithHexadecimalString:(NSString *)hexadecimalStringValue;

// 字符串 16 进制 颜色 设置 颜色 alpha ( 0XF4B711 or 0xF4B711 or #F4B711 )
+ (UIColor *)swpColorWithHexadecimalString:(NSString *)hexadecimalStringValue alpha:(CGFloat)alpha

```
---
