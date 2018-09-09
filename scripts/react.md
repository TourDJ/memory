
###### ps.children

his.props.children 属性表示组件的所有子节点。this.props.children 的值有三种可能：
* 如果当前组件没有子节点，它就是 undefined ;
* 如果有一个子节点，数据类型是 object ；
* 如果有多个子节点，数据类型就是 array 。所以，处理 this.props.children的时候要小心。
