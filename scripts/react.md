
###### ps.children

his.props.children 属性表示组件的所有子节点。this.props.children 的值有三种可能：
* 如果当前组件没有子节点，它就是 undefined ;
* 如果有一个子节点，数据类型是 object ；
* 如果有多个子节点，数据类型就是 array 。
> React 提供一个工具方法 React.Children 来处理 this.props.children 。我们可以用 React.Children.map 来遍历子节点，而不用担心 this.props.children 的数据类型是 undefined 还是 object。
