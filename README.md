# SwpFMDB

##### 封装 FMDB
```

  FMDB已经封装了SQLite，但是开发者还是需要去写 SQL 语句，对于模型中属性比较多的话，拼接SQL语句将变得十分繁琐, 字符串, 字典, 数组数据是没办法直接存入数据库，需要特殊处理 不然无法 存入数据库.

  --- 所以笔者做了面向模型的二次封装, 不需要写任何SQL语句, 屏蔽掉反锁的操作, 插入数据库是模型数据, 取出也是模型数据, 简单粗暴, 方便使用


```
---

##### 效果:

---

##### 导入:

```ruby


导入：

SwpFMDB 文件夹 导入 项目 中, 依赖 FMDB, 需要手动导入 FMDB 库文件

#import "SwpFMDBHeader.h"

CocoaPods 导入:

使用  CocoaPods 会自动 pod FMDB

pod search SwpFMDB

pod 'SwpFMDB'

#import <SwpFMDB/SwpFMDBHeader.h>

```
---

##### 代码示例:

```Objective-C

```

--
##### 1.0.0 第一次 上传
```
1. 2017-02-22 01:47:38
2. 第一次 上传 库文件

```

##### PS:

```
持续更新...

```
---
