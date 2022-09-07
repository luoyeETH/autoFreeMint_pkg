# autoFreeMint_pkg
# 快速开始    
下载地址=====>>> [release](https://github.com/luoyeETH/autoFreeMint_pkg/releases)  
![download](download.png)  

简单演示视频===>>> [查看](https://www.bilibili.com/video/BV1Pe4y1o7Lg/)  

有问题可以提issue===>>> [issue](https://github.com/luoyeETH/autoFreeMint_pkg/issues) 

# 使用说明  
## 文件目录说明

autofreemint-win.exe/autofreemint-linux  跟单程序  
keystore                                 加密后的私钥将保存在这个目录下  
config.json                              配置文件  
privateKey.json                          首次运行时填写私钥和密码   

## 首次运行流程  
1.启动跟单程序 如果缺少配置文件会自动生成  
2.在privateKey.json中填写私钥和密码  
```
{
    "privateKeyList": [
        "私钥1",
        "私钥2"
    ],
    "password": "密码"
}
```  

3.重新启动跟单程序 按提示配置相关设置  
(可选)4.输入密码 启动程序  

>linux简易教程 
```
mkdir autofreemint
cd autofreemint
wget https://github.com/luoyeETH/autoFreeMint_pkg/releases/download/v0.1.7-alpha/autofreemint-linux
chmod +x autofreemint-linux
./autofreemint-linux 首次运行生成keystore文件夹和privateKey.json
vim privateKey.json (或使用xftp等工具打开编辑)
./autofreemint-linux 按要求完成配置
保持后台运行 nohup ./autofreemint-linux & 
```

## 配置项说明  
