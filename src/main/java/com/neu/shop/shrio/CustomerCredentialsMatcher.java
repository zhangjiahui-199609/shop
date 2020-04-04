package com.neu.shop.shrio;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.crypto.hash.Md5Hash;

/*
* 密码比较器
*
 * 自定义密码比较器
 *      继承  SimpleCredentialsMatcher
 *      重写方法    :doCredentialsMatch方法
 */

public class CustomerCredentialsMatcher extends SimpleCredentialsMatcher {
    /**

         执行密码比较
	      参数：
                usernamePasswordToken（用户输入的email和密码）
                authenticationInfo : 安全数据（用户对象，数据库密码，realm名）
                返回值：
                boolean类型
	               返回false：表示登录失败（抛出异常）
            */
    @Override                             //这里是令牌中的页面数据   //传递过来的安全数据
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        //拿着安全的数据和我页面传递过来的数据进行比较(获取的是安全数据的密码，页面传递过来的也是安全数据的密码)
        //数据库中的密码
        String data_password = (String) info.getCredentials();
        System.out.println("数据库中的密码："+data_password); //数据库中的密码默认是111111加密之后的
        //页面的密码
        UsernamePasswordToken uptoken=(UsernamePasswordToken) token;

        String page_password=new String(uptoken.getPassword());//页面输入的密码,但是我们的数据库中的信息是加密 的，所以要加密之后再及逆行对比;
        String email = uptoken.getUsername();//盐
        //进行MD5加密 shiro 中的加密方式
        //参数1：要放入加密的内容 string
        //参数2;盐 string
        //参数3：放入几次盐 int
        Md5Hash md5Hash = new Md5Hash(page_password,email,1);
        String MD5_page_password = md5Hash.toString();
        System.out.println("页面传递过来的MD5加密的密码:"+MD5_page_password);
        //拿着数据库中的内容和页面加密过的内容进行一个比较，相同返回true，不相同 返回 false 抛异常了
        return data_password.equals(MD5_page_password);//返回true shiro自动会把这个对象存起来
    }
}
