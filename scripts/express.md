
### 获取参数的三种方法

1. req.params   
例如： http://localhost:3000/blog/12， 实际路由是"blog/:id"

    let id = req.params.id

2. req.query    
例如: http://localhost:3000/blog/id=12

    let id = req.query.id

3. req.body 
例如: http://localhost:3000/blog， 通过 post 请求传送数据。
    `
    {
      "id": 12
    }
`
这种方式是通过 req.body.id 获取数据

    let id = req.body.id
