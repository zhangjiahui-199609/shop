配置文件中配置安全管理器，自定义realm
realm域配置AuthRealm,和自定义的密码比较器CustomerCreadentialsMatcher
登录步骤:   先调用shiro的api获得subject对象，再创建对应的令牌，这里使用用户名密码进行登录，所以
创建用户名密码的令牌，构建好令牌后，就要去realm中进行认证（AuthenticationInfo），通过token获取到对应的用户名，
去数据库中进行查找，如果找到了调用密码比较器进行比较，比较成功后会生成安全数据 进行返回，返回后如果从subject中获取到安全数据后
存储到session域当中，完成登录。
鉴权：
使用过滤器，如果shrio中没有安全数据，访问资源超标，将会跳转到一个界面
当权限不足时跳转到一个界面
设置放行的资源，perms:具有这个权限的才能访问这个路径，anon：没有登录就能访问的资源
在Reaml中：从安全数据中获取当前登录用户，在执行查询这个用户应该有的权限，并把这些权限放到set当中，
把这个拥有指定权限的内容设置到AuthorizationInfo中。 setStringPermissions(); 返回，xml中带有perms的路径就会被拦截
