# 资源仓储

+ 了解仓储的功能
+ 默认仓储模式的使用
+ 仓储事件

## 资源仓储

仓储的功能主要就是用于对领域对象的存储管理，对象和仓储的关系可以很好的用现实中物品和仓库的关系作为类比，仓库负责物品的存放管理操作，对各种不同的种类的物品管理存放的方式也是不一样的，所以针对系统中不同性质，结构的数据对象都要使用合适的仓储模式来负责对象的存储管理。虽然仓储是负责领域对象的存储，但是在现实的系统开发中数据通常最后是会持久化到数据库的，所以仓储在实际开发中也扮演着业务对象转移到数据实体进行数据操作的桥梁。

## 仓储模式

业务对象的数据类型，结构决定了应该使用什么样的仓储模式来管理对象的存储，框架中总结实现了几种常见的仓储模式来满足开发中常见的业务场景，当然在实际开发中也可以根据自己的需求自定义仓储实现。

| 仓储接口 | 默认实现 | 说明 |
| ------ | ------ | ------ |
| IAggregationRepository | DefaultAggregationRepository | 默认领域对象仓储模式，也是使用最广泛的模式,参考:IRoleRepository->RoleRepository |
| IRelationRepository | DefaultRelationRepository | 关系结构数据仓储模式，参考：IUserRoleRepository->UserRoleRepository |
| IAggregationRelationRepository | DefaultAggregationRelationRepository | 关系结构领域对象仓储模式，参考：IUserAuthorizeRepository->UserAuthorizeRepository |
| IThreeRelationRepository | DefaultThreeRelationRepository| 三者关系结构数据仓储模式，使用方式类似于IRelationRepository模式 |
| IAggregationThreeRelationRepository | DefaultAggregationThreeRelationRepository| 三者关系结构领域对象仓储模式，使用方式类似于IAggregationRelationRepository模式 |

## 仓储事件