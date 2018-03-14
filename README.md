# SwpFMDB


### SwpFMDB

<!--
[![CI Status](http://img.shields.io/travis/swp-song/SwpFMDB.svg?style=flat)](https://travis-ci.org/swp-song/SwpFMDB)
-->

[![Version](https://img.shields.io/cocoapods/v/SwpFMDB.svg?style=flat)](http://cocoapods.org/pods/SwpFMDB) [![License](https://img.shields.io/cocoapods/l/SwpFMDB.svg?style=flat)](http://cocoapods.org/pods/SwpFMDB) [![Platform](https://img.shields.io/cocoapods/p/SwpFMDB.svg?style=flat)](http://cocoapods.org/pods/SwpFMDB)

-------

### 封装 FMDB

> * 之前做的项目需要大量持久化存储数据, 使用 **FMDB** 需要些大量的 SQL 语句····😂😂😂😂😂😂。
> * **FMDB** 已经封装了 **SQLite**，但是开发者还是需要去写 **SQL** 语句，对于模型中属性比较多的话，拼接 **SQL** 语句将变得十分繁琐， 字典， 数组数据是没办法直接存入数据库, 需要特殊处理。
> * 面向模型开发，操作模型，更加面向对象, 操作起来更加方便。
> * 所以笔者做了面向模型的二次封装，不需要写任何 **SQL** 语句， 屏蔽掉反锁的操作，插入数据库是模型数据，取出也是模型数据，简单粗暴， 方便使用.

-------

### 导入:

* 手动导入：
	> * SwpFMDB 文件夹导入项目中。
	> * **SwpFMDB** 依赖库 FMDB 需要手动导入项目中。
	> * **`#import "SwpFMDBHeader.h"`**
	> * **[FMDB 下载地地址](https://github.com/ccgus/fmdb)**

* CocoaPods 导入:
	> * **`pod search SwpFMDB`**
	> * **`pod 'SwpFMDB'`**
	> * **`#import <SwpFMDB/SwpFMDBHeader.h>`**
	> * **pod** 导入会自动添加依赖库，无需手动导入。

-------

#### SwpFMDB API 详细文档:

> * **[SwpFMDB Api 首页](http://swp-song.com/docs/SwpFMDB/index.html)**
> * **[SwpFMDB Api 外部调用接口](http://swp-song.com/docs/SwpFMDB/Classes/SwpFMDB.html)**
> * **[SwpFMDB Api 核心类](http://swp-song.com/docs/SwpFMDB/Classes/SwpFMDBManager.html)**

-------


### 版本记录

> * 版本版本：2.1.3
> * 更新时间：2018-03-14 09:58:13
> * 更新内容：
>> * 修复一些警告问题，迭代更新。

-------

> * 版本版本：2.1.2
> * 更新时间：2017-08-26 14:43:40
> * 更新内容：
>> * 更新文档链接

-------


### 备注

> * **持续更新, 如果喜欢, 欢迎 Star**
> * **[个人博客](http://swp-song.com)**
> * **[简书](http://www.jianshu.com/u/c8b052c6e561)**

-------

### 声明

> * **著作权归 ©swp_song, 如需转载请标明出处。**

-------


