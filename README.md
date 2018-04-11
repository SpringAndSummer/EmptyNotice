# EmptyNotice
#### 使用runtime被页面添加空白提示图
###### 实现思路,使用Objective-C 中 Associated Objects,给view(关联者)关联一个空白关联对象(空白展示图),来达到添加空白图的效果;

主要使用到的方法:
>objc_setAssociatedObject(id _Nonnull object, const void * _Nonnull key, id _Nullable value, objc_AssociationPolicy policy)
objc_getAssociatedObject(id _Nonnull object, const void * _Nonnull key)

#### 解释:
- objc_setAssociatedObject作用:用于给对象添加关联对象，传入 nil 则可以移除已有的关联对象；
它有四个参数,分别表示 源对象，关键字，关联的对象和一个关联策略;
1. id object 表示关联者，是一个对象，变量名理所当然也是object
2. id value 表示被关联者，变量名是value，它要关联到object上的。
3. 关键字是一个void类型的指针。每一个关联的关键字必须是唯一的。通常都是会采用静态变量来作为关键字。
4. 关联策略表明了相关的对象是通过赋值，保留引用还是复制的方式进行关联的；还有这种关联是原子的还是非原子的。这里的关联策略和声明属性时的很类似。
这种关联策略是通过使用预先定义好的常量来表示的。

#### 这里有五种策略:
> OBJC_ASSOCIATION_ASSIGN = 0,              弱引用关联对象,等价于属性的assign和unsafe_unretained
> OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,    强引用关联对象，且为非原子操作,等价于属性的strong
> OBJC_ASSOCIATION_COPY_NONATOMIC = 3,      复制关联对象，且为非原子操作,等价于属性的copy
> OBJC_ASSOCIATION_RETAIN = 01401,          强引用关联对象，且为原子操作,等价于属性的strong
> OBJC_ASSOCIATION_COPY = 01403             复制关联对象，且为原子操作,等价于属性的copy
对于2和4,3和5策略,唯一区别是是都具有原子性;

- objc_getAssociatedObject作用是:根据关联字获取关联对象；
1. id object 表示关联者，是一个对象;
2. key 关联对象的关键字

#### PS:还有一个方法不常用,objc_removeAssociatedObjects(id _Nonnull object),这个方法用来移除关联者(id object)的所有关联对象，将该对象恢复成“原始”状态。这样做就很有可能把别人添加的关联对象也一并移除，这并不是我们所希望的。
