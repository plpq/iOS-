# ICPushService
## 

##一.配置
-----

    1.需要申请推送证书(测试或生产环境),并设置对应的Bundle ID,Xcode选择对应的证书
    2.Xcode配置需要打开Push Notifications以及Background Modes开关,并勾选Remote notifications选项
    3.根据http,https进行相应的设置,保证网络通畅(ATS)

##二.使用说明
------

    1.-(BOOL)ICPushApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions:通过在appdelegete里的didFinishLaunchingWithOptions方法里调用进行通知的注册

    2.EncryptionType:缺省为EncryptionTypeNone,表示向服务端发送不需要对参数进行加密等处理的请求;
    EncryptionTypeDo表示向服务器发送对参数进行加密等处理的请求.

    3.hostStr:服务端的ip地址

    4.requestMethod:传入GET,POST方式(缺省为GET)

    5.- (void)ICPushApplication:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken:在系统didRegisterForRemoteNotificationsWithDeviceToken方法里调用

    6.- (void)sendDeviceTokenToService:(NSString *)urlStr:GET请求不需要调用,POST请求在didRegisterForRemoteNotificationsWithDeviceToken里调用,urlStr传入参数拼接的字符串

    7.- (void)ICBecomeActive:(UIApplication *)application:在applicationDidBecomeActive方法里调用,处理角标

### 


