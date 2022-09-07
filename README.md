# autoFreeMint_pkg
# 快速开始    
**[windows教程](#windows教程)  [linux教程](#linux教程)**  

下载地址[release](https://github.com/luoyeETH/autoFreeMint_pkg/releases)  
![download](download.png)  

简单演示视频[查看](https://www.bilibili.com/video/BV1Pe4y1o7Lg/)  

有问题可以提issue[提issue](https://github.com/luoyeETH/autoFreeMint_pkg/issues) 

# 使用说明  
## 文件目录说明

autofreemint-win.exe/autofreemint-linux  跟单程序  
keystore                                 加密后的私钥将保存在这个目录下  
config.json                              配置文件  
privateKey.json                          首次运行时填写私钥和密码   

## 首次运行流程  
### windows教程  
1.在[release](https://github.com/luoyeETH/autoFreeMint_pkg/releases)中下载最新版本的exe程序  
2.双击启动跟单程序，第一次运行时会闪退，然后会多出keystore和privateKey.json两个文件  
3.在privateKey.json中填写私钥和密码   
```
{
    "privateKeyList": [
        "私钥1",
        "私钥2"
    ],
    "password": "密码"
}
```  

3.重新启动跟单程序，按提示配置相关设置即可  

### linux教程 
```
1.使用xshell等工具连接服务器
2.新建目录
mkdir autofreemint
3.切换到该目录
cd autofreemint
4.一键获取最新版跟单脚本并生成初始化文件
wget -N --no-check-certificate https://raw.githubusercontent.com/luoyeETH/autoFreeMint_pkg/main/install.sh && chmod 775 install.sh && bash install.sh
5.配置privateKey.json
vim privateKey.json (或使用xftp等工具打开编辑，填入私钥和密码)
{
    "privateKeyList": [
        "私钥1",
        "私钥2"
    ],
    "password": "密码"
}
6.运行程序
./autofreemint-linux 按要求完成配置
(7.)保持后台运行 
nohup ./autofreemint-linux & 
```

## 配置项说明  

### 默认配置说明  
默认配置只需要用户填写alchemyKey和followAddress  
将默认开启pending跟单模式，并以最大50，优先费2的预设gas发送交易，只跟免费交易，不做gas消耗限制，启动全部账户。  

### 配置项详解  

`required` **必填项**    
`alchemyKey` alchemyKey提供的apiKey，[申请地址](https://alchemyapi.io/)，填写到双引号中  
`followAddress` 要跟随的地址，填写的格式为["地址1","地址2"]  
  
 `optional` **可选项**  
 `password` keystore的密码，可不填。不填写时需要每次启动时手动输入密码  
 `runMode` [pending/log] 两种跟单模式，pending更快，但有可能跟到非mint的操作，log慢一个区块，只会跟mint操作。默认为pending模式  
 `mintToMode` [self/collect] 针对mintTo方法，跟单会自动替换为自己地址，self模式会替换到发送者地址，需要手动归集或重复授权上架，collect会替换为第一个加载的账户地址，mint时即完成归集，但可能受不同合约影响mint失败。默认为self模式    
 `maxPriority` 预设的优先费，优先费越高的交易在同一区块中更快被确认。默认为2  
 `maxGasPrice` 预设的最大gasPrice。默认为50
 > 预设gas只在autoGas关闭情况下生效  
 
 `maxValue` 最大跟单时的付费金额，单位eth。默认为0  
 `autoGas` 自动gas模式  
 ----`enable` [true/false] autoGas开关，打开时为自动gas模式，关闭时为预设gas模式。默认关闭  
 ----`gasMode` [fast/normal] 自动gas速度选择，fast速度更快，消耗gas更多，normal消耗gas略低，但可能会失败。默认fast  
 `maxGas_USD` 以美元计价的最大gas限制  
 ----`enable` [true/false] maxGas_USD开关，打开后会预估gas消耗。默认关闭  
 ----`value` 直接填写数字，不需要双引号。默认0   
 `useAccount` 开启跟单的账户，填0全部开启。默认0  
 ----`enable` [true/false] useAccount开关。默认关闭  
 ----`value` 直接填写数字，不需要双引号。默认0   
 `multiAccountConfig` 动态多账户模式  
 ----`enable` [true/false] 动态多账户开关。默认关闭  
 ----`gasGearsList` gas档位配置[档位1, 档位2, 档位3]  
 ----`useAccountGearsList` 使用账号档位配置[账号数1，账号数2，账号数3]  
 > 举例   
 ```
 以下配置效果为：在gas0-10时使用5个账号跟单，10-20时使用3个账号跟单，20-50时使用一个账号跟单  
 "multiAccountConfig": {
	"enable": true,
	"gasGearsList": [10, 20, 50],
	"useAccountGearsList": [5, 3, 1]
	},
```
`messagePushConfig` 消息推送配置  
`enable` [true/false] 消息推送开关。默认关闭  
`pushFlag_dc` [true/false] 推送discord开关。默认关闭  
`discordKey` discord-webhook-key 填写`https://discordapp.com/api/webhooks/${discordKey}`discordKey部分  
`pushFlag_bark` [true/false] 推送bark开关。默认关闭  
`barkKey` IOS推送软件bark的key 填写`https://api.day.app/${barkKey}/`barkKey部分  
`contractBlacklist` 合约地址黑名单。默认包含opensea,x2y2,looksrare,ens,gem等合约地址，在pending跟单模式中，当接受方在黑名单地址中，交易不会发送。  
`methodBlacklist` 方法黑名单。默认包含setApproveForAll,Approve,tansferFrom等方法，在pending跟单模式中，当跟单地址进行这些操作时，交易不会发送  

`test` **测试选项**  
`enable` [true/false] 测试模式开关。默认关闭  
`testnet` 填写测试网。默认goerli  

```
{
	"required": {
		"alchemyKey": "",
		"followAddress": [
			""
		]
	},
	"optional": {
		"password": "",
		"runMode": "pending",
		"mintToMode": "self",
		"maxPriority": 2,
		"maxGasPrice": 50,
		"maxValue": 0,
		"autoGas": {
			"enable": false,
			"gasMode": "fast"
		},
		"maxGas_USD": {
			"enable": false,
			"value": 0
		},
		"useAccount": {
			"enable": false,
			"value": 0
		},
		"multiAccountConfig": {
			"enable": false,
			"gasGearsList": [],
			"useAccountGearsList": []
		},
		"messagePushConfig": {
			"enable": false,
			"pushFlag_dc": false,
			"discordKey": "",
			"pushFlag_bark": false,
			"barkKey": ""
		},
		"contractBlacklist": [
			"0x00000000006c3852cbef3e08e8df289169ede581",
			"0x74312363e45dcaba76c59ec49a7aa8a65a67eed3",
			"0x59728544b08ab483533076417fbbb2fd0b17ce3a",
			"0x084b1c3c81545d370f3634392de611caabff8148",
			"0x83c8f28c26bf6aaca652df1dbbe0e1b56f8baba2",
			"0x0a267cf51ef038fc00e71801f5a524aec06e4f07",
			"0xb4fbf271143f4fbf7b91a5ded31805e42b2208d6",
			"0x283Af0B28c62C092C9727F1Ee09c02CA627EB7F5"
		],
		"methodBlacklist": [
			"0x",
			"0xa22cb465",
			"0x42842e0e",
			"0x23b872dd",
			"0x095ea7b3"
		]
	},
	"test": {
		"enable": false,
		"testnet": "goerli"
	}
}
```










