
## mongoose 中间件

中间件也称 pre 和 post 钩子函数，通过向异步函数传值实现业务逻辑。mongoose 中总共有 4 种中间件：文档、模块、聚合和查询。


### 文档中间件

    init
    validate
    save
    remove

pre
  一共有两种pre中间件 serial 和 parallel。
  
serial 中间件是一个一个的执行

    var schema = new Schema(..);
    schema.pre('save', function(next) {
      // do stuff
      next();
    });

parallel 

var schema = new Schema(..);

    // `true` means this is a parallel middleware. You **must** specify `true`
    // as the second parameter if you want to use parallel middleware.
    schema.pre('save', true, function(next, done) {
      // calling next kicks off the next middleware in parallel
      next();
      setTimeout(done, 100);
    });

post
