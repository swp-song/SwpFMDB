# SwpFMDB

##### 封装 FMDB

```
1. 之前做的项目需要大量持久化存储数据, 使用 FMDB 需要些大量的 SQL 语句····😂😂😂😂😂😂

2. FMDB 已经封装了 SQLite，但是开发者还是需要去写 SQL 语句，对于模型中属性比较多的话，拼接SQL语句将变得十分繁琐, 字典, 数组数据是没办法直接存入数据库, 需要特殊处理

3. 面向模型开发, 操作模型，更加面向对象, 操作起来更加方便

4. 所以笔者做了面向模型的二次封装, 不需要写任何SQL语句, 屏蔽掉反锁的操作, 插入数据库是模型数据, 取出也是模型数据, 简单粗暴, 方便使用.
```

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

#### SwpFMDB API (简介)简单介绍


```Objective-C

1. SwpFMDBHeader.h    头文件

2. SwpFMDB.h          核心类文件

// 单利创建
+ (instancetype)shareManager;

// 创建 数据库表, modelClass 模型类 Class，swpFMDBExecutionUpdateComplete 执行完成回调
- (void)swpFMDBCreateTable:(Class)modelClassswpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;


// 插入 单条 数据, model 是模型数据, swpFMDBExecutionUpdateComplete 执行完成回调
[[SwpFMDB shareManager] swpFMDBInsertModel:model swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
	NSLog(@"%@", executionStatus ? @"插入成功" : @"插入失败");
}];

// 修改 单条 数据, model 是 模型数据，swpFMDBExecutionUpdateComplete 执行完成回调
[[SwpFMDB shareManager] swpFMDBUpdateModel:model swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
	NSLog(@"%@", executionStatus ? @"修改成功" : @"修改失败");
}];

// 查询所有数据, modelClass 模型类 Class，swpFMDBExecutionSelectModelsComplete 执行完成回调
[[SwpFMDB shareManager] swpFMDBSelectModels:modelClass swpFMDBExecutionSelectModelsComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus, NSArray * _Nonnull models) {
	NSLog(@"%@", models);
}];

.... 更多 API 详见 Demo

```

---

##### 版本记录

```
1. 版本版本: 1.1.3

2. 更新时间: 2017-03-08 09:01:23

3. 更新内容:
	* 更新 .md 文件, 修改小一些版本记录信息
```

---

```
1. 版本版本: 1.1.2

2. 更新时间: 2017-03-07 16:20:26

3. 更新内容:
	* 删除, 一组数据
	* - (void)swpFMDBDelegateModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;

	* 清除，全部数据
	* - (void)swpFMDBClearModel:(Class)modelsClass swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;
```

---

```
1. 版本版本: 1.0.3

2. 更新时间: 2017-03-03 18:14:26

3. 更新内容:
	*  删除，单条 数据:
	*  - (void)swpFMDBDelegateModel:(id)model swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;
```

---

##### PS:

```
持续更新...
	1. 下次更新删除表
```

---


