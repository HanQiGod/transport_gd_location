-keep class com.hyphenate.** {*;}
-dontwarn  com.hyphenate.**
#//3.6.8版本之后移除apache无需再添加
-keep class internal.org.apache.http.entity.** {*;}
#//如果使用了实时音视频功能
-keep class com.superrtc.** {*;}
-dontwarn  com.superrtc.**



#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
#//3D 地图 V5.0.0之前：
-keep   class com.amap.api.maps.**{*;}
-keep   class com.autonavi.amap.mapcore.*{*;}
-keep   class com.amap.api.trace.**{*;}

#//3D 地图 V5.0.0之后：
-keep   class com.amap.api.maps.**{*;}
-keep   class com.autonavi.**{*;}
-keep   class com.amap.api.trace.**{*;}

#//定位
-keep class com.amap.api.location.**{*;}
-keep class com.amap.api.fence.**{*;}
-keep class com.loc.**{*;}
-keep class com.autonavi.aps.amapapi.model.**{*;}

#//搜索
-keep   class com.amap.api.services.**{*;}

#//2D地图
-keep class com.amap.api.maps2d.**{*;}
-keep class com.amap.api.mapcore2d.**{*;}

#//导航
-keep class com.amap.api.navi.**{*;}
-keep class com.autonavi.**{*;}
-keep class com.alibaba.mit.alitts.*{*;}
-keep class com.google.**{*;}

#高德地图的混淆
-dontwarn com.amap.api.**
-dontwarn com.a.a.**
-dontwarn com.autonavi.**
-keep class com.amap.api.**  {*;}
-keep class com.autonavi.**  {*;}
-keep class com.a.a.**  {*;}


-keep class com.p595263720.o_amap.nav.**  { *; }
-keep class com.p595263720.o_amap.map.**  { *; }
-keep class com.p595263720.o_amap.search.**  { *; }
-keep class com.p595263720.o_amap.location.**  { *; }

#scan二维码
-ignorewarnings
-keepattributes *Annotation*
-keepattributes Exceptions
-keepattributes InnerClasses
-keepattributes Signature
-keepattributes SourceFile,LineNumberTable
-keep class com.huawei.hianalytics.**{*;}
-keep class com.huawei.updatesdk.**{*;}
-keep class com.huawei.hms.**{*;}

#华为推送
-ignorewarnings
-keepattributes *Annotation*
-keepattributes Exceptions
-keepattributes InnerClasses
-keepattributes Signature
-keepattributes SourceFile,LineNumberTable
-keep class com.hianalytics.android.**{*;}
-keep class com.huawei.updatesdk.**{*;}
-keep class com.huawei.hms.**{*;}