
React 使用

要渲染 React 组件，只需创建一个大写字母开头的本地变量。
如：
```babel(javascript)
const Navi = () => (
  <nav>
    <ul>
      <li>
        <Link to="/">Home</Link>
      </li>
      <li>
        <Link to="/about/">About</Link>
      </li>
      <li>
        <Link to="/users/">Users</Link>
      </li>
    </ul>
  </nav>
)
```



###### this.props.children

this.props.children 属性表示组件的所有子节点。this.props.children 的值有三种可能：
* 如果当前组件没有子节点，它就是 undefined ;
* 如果有一个子节点，数据类型是 object ；
* 如果有多个子节点，数据类型就是 array 。
> React 提供一个工具方法 [React.Children](https://reactjs.org/docs/react-api.html#reactchildren) 来处理 this.props.children 。我们可以用 React.Children.map 来遍历子节点，而不用担心 this.props.children 的数据类型是 undefined 还是 object。


## [history](https://router.vuejs.org/zh/guide/essentials/history-mode.html#%E5%90%8E%E7%AB%AF%E9%85%8D%E7%BD%AE%E4%BE%8B%E5%AD%90)

* browser history: history 在 DOM 上的实现，用于支持 HTML5 history API 的浏览器
* hash history: history 在 DOM 上的实现，用于旧版浏览器。
* memory history: history 在内存上的实现，用于测试或非 DOM 环境（例如 React Native）。
