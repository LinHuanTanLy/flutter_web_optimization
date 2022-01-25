# 提速方法

## 切片
对于不必要马上初始化的页面，进行延迟加载deferred
```
import 'my_app.dart' deferred as app;

runApp(FutureBuilder(
      future: app.loadLibrary(),
      builder: (c, _) {
        if (_.connectionState == ConnectionState.done) {
          return app.MyApp();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }));
```


## 替换暂无用到的字体
如果项目当中没有自定义字体，Flutter 默认会打包 MaterialIcons-Regular.otf 和 CupertinoIcons.ttf 这两种字体库。

这两种字体是包含了一些预置的 Material 和 iOS 设计风格 icon，所有体积较大，如果项目当中没有用到相关的 Icon，我们可以对这些字体库进行简化。

从 https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fgoogle%2Fmaterial-design-icons 中下载 MaterialIcons-Regular.ttf 字体库。

在 Web 产物中, 将 MaterialIcons-Regular.ttf 原有的 ./build/web/assets/fonts/MaterialIcons-Regular.otf 字体库。

可以将 build/web/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf 的字体库删除。

修改build/web/assets/FontManifest.json 中字体的相关配置。需要修改字体格式以及去除不用字体的引用路径。

以上操作可以通过编写脚本方式在生成 Web 产物之后进行修改。
修改build/web/assets/FontManifest.json 中字体的相关配置。需要修改字体格式以及去除不用字体的引用路径。替换
修改build/web/assets/FontManifest.json 中字体的相关配置。需要修改字体格式以及去除不用字体的引用路径。

## canvaskit模式替换cdn
```
flutter build web --release --web-renderer canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.25.1/bin/
```
但是测试了一下 并没有很大提升。

## 待续
