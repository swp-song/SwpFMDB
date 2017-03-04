# SwpFMDB

##### 封装 FMDB
```

  FMDB已经封装了SQLite，但是开发者还是需要去写 SQL 语句，对于模型中属性比较多的话，拼接SQL语句将变得十分繁琐, 字符串, 字典, 数组数据是没办法直接存入数据库，需要特殊处理 不然无法 存入数据库.

  --- 所以笔者做了面向模型的二次封装, 不需要写任何SQL语句, 屏蔽掉反锁的操作, 插入数据库是模型数据, 取出也是模型数据, 简单粗暴, 方便使用


```

---

##### 效果：
![(图片轮播效果)](https://raw.githubusercontent.com/swp-song/SwpFMDB/master/Screenshot/InsterData.gif)![(图片轮播效果)](https://raw.githubusercontent.com/swp-song/SwpFMDB/master/Screenshot/UpdateData.gif)![(图片轮播效果)](https://raw.githubusercontent.com/swp-song/SwpFMDB/master/Screenshot/SelectData.gif)![(图片轮播效果)](https://raw.githubusercontent.com/swp-song/SwpFMDB/master/Screenshot/DeleteData.gif)

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

	SwpFMDB *swpFMDB = [SwpFMDBshareManager];

	// 插入 单条 数据
	[swpFMDBswpFMDBInsertModel:model swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"插入成功" : @"插入失败");
    }];

	  // 修改 单条 数据
     [swpFMDB swpFMDBUpdateModel:model swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"修改成功" : @"修改失败");
    }];

    .... 更多请查看代码

```

--
##### 1.0.3 第一次 上传
```
1. 2017-03-03 18:14:26
2. 新增 删除 单条数据方法,

  - (void)swpFMDBDelegateModel:(id)model swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;

```
--

--
##### 1.0.2 第一次 上传
```
1. 2017-03-03 07:50:08
2. 更新 Demo 上传版本

```
--
##### 1.0.0 第一次 上传
```
1. 2017-02-22 01:47:38
2. 第一次 上传 库文件

```

##### PS:

```
1. 近期更新, 删除 单条数据, 删除多条数据, 删除表, 清空数据库
持续更新...

```
---


