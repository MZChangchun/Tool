# Tool
# NSDate+MZ_Check 时间格式化类比

项目中，会有服务器发送过来时间精确到秒，但是显示却要求有 刚刚 30分钟前 昨天 前天之类的。这里直接写了一个类比拉进去使用即可,很简单的逻辑。

```
NSString * timeStr =  [NSDate mz_fromat_time:TIME introDateFormat:@"yyyy-MM-dd HH:mm:ss"];
```

逻辑图如下
<div align=center><img  src="https://github.com/MZChangchun/Tool/image/flowChart.png"/></div>


