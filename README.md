# modelessView

### 介绍

OBJC非模态提醒alert框

非模态就是弹出提示后，不用任何操作，自动消失。

### 使用

把modelessView目录级其文件拖进项目

导入类
```objective-c
#import "ModelessAlertView.h"
```
 在需要提示的地方调用
 ```objective-c
 
[[ModelessAlertView instance]showAlert:@"Hello World" dict:@{@"width":@"300",//宽度

       @"textAlignment":@"center",//option 文字对齐方式  可输入 left 或 rigth
       
       @"delay":@"3",//延时消失时间 
       
       @"positionX":@"center",//option 垂直位置 可输入 top 或 bottom
      }
];

```

可参考demo例子

     
![image](https://github.com/jeiry/modelessView/blob/master/Screen_Shot.png)
