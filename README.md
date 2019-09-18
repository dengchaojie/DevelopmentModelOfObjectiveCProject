# DevelopmentModelOfObjectiveCProject
 
 ### 工程目录
 参考下图
 ![](https://user-gold-cdn.xitu.io/2019/9/18/16d43203f09f4c78?w=530&h=920&f=png&s=518833)
 
 - 业务，按照MVC架构开发
 - CommonVC
 ---Controllers，包括CustomViewController，TabBarController，WebViewController，NavigationController
 ---Views，包括UI*开头的类的扩展，
 - Tool，包括NS*开头的类的扩展，团队写的库，第三方库的封装，
 - SDK，放第三方的库，最好放到pod
 
 
 ### 安全
 - 将域名和key，放到.m文件中，防止APP被砸壳，攻击域名和破解加密。例如，
 extern NSString* const url;// .h
 NSString* const url = @"https://www.baidu.com/";
 
 - 检测网络代理
 - 比对后台证书：将后台证书放入工程，比对HTTPS收到的证书
 - 敏感数据加密：后台下发rsa公钥，加密敏感数据；或者加密随机字符串，作为aes秘钥，来加密敏感数据
 - 校验数据完整性，用sha-256
 
 ### 多tagart
 把各tagart的配置，写到各自的info.plist。
 
 ### Demo
 https://github.com/dengchaojie/DevelopmentModelOfObjectiveCProject
