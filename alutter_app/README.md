# alutter_app

A new Flutter project.

## 组件总结

### 布局的组件
Align 
Center
Row
Column

### Flutter中尺寸限制类容器组件包括ConstrainedBox、UnconstrainedBox、SizedBox、AspectRatio、FractionallySizedBox、LimitedBox、Container。这些组件可以约束子组件的尺寸，下面一一介绍。

ConstrainedBox: 约束子组件不可超过限制
UnconstrainedBox: 约束的子组件允许超过自身限制，但是自身受父组件限制，debug 会给提示，release 超出部分会被截取。
