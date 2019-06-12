# 修改表达式

+ 了解修改表达式的功能
+ 熟悉常用的数据修改方式

## 数据修改表达式

在需要修改数据的情况下，出了可以通过修改对象的方式外还可以通过修改表达式来直接对资源对象进行修改，这并非是常规的面向对象的操作，所以应该确保只有在必要的情况下才使用修改表达式进行数据的修改。

## 使用修改表达式

下面通过几个不同的业务场景功能来示范常见的表达式功能

1：修改编号为123的角色的名称为“角色123”

```C#

//设置修改条件
var roleQuery = QueryFactory.Create<RoleQuery>(r => r.SysNo == 123);
//要修改的值
var nameModify = ModifyFactory.Create();
nameModify.Set<RoleQuery>(r => r.Name, "角色123");
//执行数据修改
roleRepository.Modify(nameModify, roleQuery);

```

2：将Level为1的角色的Sort统一加1

```C#

//设置修改条件
var roleQuery = QueryFactory.Create<RoleQuery>(r => r.Level == 1);
//要修改的值
var nameModify = ModifyFactory.Create();
nameModify.Add<RoleQuery>(r => r.Sort, 1);
//执行数据修改
roleRepository.Modify(nameModify, roleQuery);

```

3：将Level为1的角色的Sort统一减1

```C#

//设置修改条件
var roleQuery = QueryFactory.Create<RoleQuery>(r => r.Level == 1);
//要修改的值
var nameModify = ModifyFactory.Create();
nameModify.Subtract<RoleQuery>(r => r.Sort, 1);
//执行数据修改
roleRepository.Modify(nameModify, roleQuery);

```

4：将Level为1的角色的Sort统一乘2

```C#

//设置修改条件
var roleQuery = QueryFactory.Create<RoleQuery>(r => r.Level == 1);
//要修改的值
var nameModify = ModifyFactory.Create();
nameModify.Multiply<RoleQuery>(r => r.Sort, 2);
//执行数据修改
roleRepository.Modify(nameModify, roleQuery);

```

5：将Level为1的角色的Sort统一除2

```C#

//设置修改条件
var roleQuery = QueryFactory.Create<RoleQuery>(r => r.Level == 1);
//要修改的值
var nameModify = ModifyFactory.Create();
nameModify.Divide<RoleQuery>(r => r.Sort, 2);
//执行数据修改
roleRepository.Modify(nameModify, roleQuery);

```