# SwpFMDB

##### 封装 FMDB

```
1. 之前做的项目需要大量持久化存储数据, 使用 FMDB 需要些大量的 SQL 语句····😂😂😂😂😂😂

2. FMDB 已经封装了 SQLite，但是开发者还是需要去写 SQL 语句，对于模型中属性比较多的话，拼接SQL语句将变得十分繁琐, 字典, 数组数据是没办法直接存入数据库, 需要特殊处理

3. 面向模型开发, 操作模型，更加面向对象, 操作起来更加方便

4. 所以笔者做了面向模型的二次封装, 不需要写任何SQL语句, 屏蔽掉反锁的操作, 插入数据库是模型数据, 取出也是模型数据, 简单粗暴, 方便使用.
```

-------


##### 导入:

```ruby

1. 手动导入：

	* SwpFMDB 文件夹导入项目中.

	* #import "SwpFMDBHeader.h"     // 头文件

	* 依赖库 FMDB 需要手动导入.

2. CocoaPods 导入:

	* pod search SwpFMDB

	* pod 'SwpFMDB'

	* #import <SwpFMDB/SwpFMDBHeader.h>

	* pod 导入会自动添加依赖库, 无需手动导入.

```

-------

##### 版本记录

```
1. 版本版本: 1.3.0

2. 更新时间: 2017-08-15 14:02:16

3. 更新内容:
	* swpFMDBDeleteTable:swpFMDBExecutionSelectModelsComplete:   < 新增删表方法 >
	* 更新 Demo

```

-------


#### 备注：
```
持续更新, 如果喜欢, 欢迎 Star
```

-------

#### 声明:

**著作权归 ©swp_song, 如需转载请标明出处**

-------


