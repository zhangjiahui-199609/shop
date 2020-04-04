package com.neu.shop.shrio;


import com.neu.shop.pojo.Admin;
import com.neu.shop.pojo.Module;
import com.neu.shop.service.AdminService;

import com.neu.shop.service.ModuleService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;

public class AuthRealm extends AuthorizingRealm {
    @Autowired
    private AdminService adminService;
/*    @Autowired
    private ModuleService moduleService;*/

    //认证

    /**
     * 参数：AuthenticationToken（传递过来的UserNameAndPasswordToken）
     * 继承AuthorizingRealm类，重写doGetAuthenticationInfo(AuthenticationToken authenticationToken)方法
     * 如果用户不存在：返回null（自动抛出异常）
     * 用户存在：返回安全数据（AuthenticationInfo）
     * 自动的调用密码比较器
     */
    @Override//认证
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        //1、获取用户名
        UsernamePasswordToken upToken = (UsernamePasswordToken) authenticationToken;
        String email = upToken.getUsername();
        //2、根据用户名去数据库中查询数据
        Admin user = adminService.findByEmail(email);//得到数据库中的安全数据
        if (user != null) {
            //调用这个密码比较器
            //参数 Object principal, Object credentials, String realmName
            //1:安全数据，也就是我从数据库中查询出来的数据 principal
            //2：安全数据的密码 credentials
            //3：我realm的名称 realmName
            return new SimpleAuthenticationInfo(user, user.getPassword(), this.getName());
        }

        //如果是空 抛异常
        return null;
    }

    /**
     * 授权 : 获取当前登录用户的所有操作权限交给shiro管理
     * 重写doGetAuthorizationInfo(PrincipalCollection principalCollection)方法
     * 参数：PrincipalCollection（shiro中安全数据的集合）
     * 获取当前登录的用户对象：user
     * 返回值：AuthorizationInfo（当前操作用户的所有权限对象）
     * 返回对象的时候，将权限交给shiro管理（shiro会自动的判断是否具有权限）
     */
    @Override//授权
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        //获取当前登录用户 获取安全数据中的user对象
        Admin user = (Admin) principalCollection.getPrimaryPrincipal();
        //从数据库中查询 根据用户查询模块
//        List<Module> list = moduleService.findMenuByDgree(user.getAdminid());

        //构造方法的返回值
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        HashSet set = new HashSet<>();

//        for (Module module : list) {
//            set.add(module.getName());
//        }
        set.add(user.getDgreeName());
        System.out.println(set);
        //这个就是给这个管理用户权限了
        info.setStringPermissions(set);
        return info;
    }
}
