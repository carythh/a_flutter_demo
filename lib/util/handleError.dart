import 'dart:async';

import 'package:a_flutter_demo/res/constant.dart';
import 'package:flutter/widgets.dart';

/// 捕获全局异常，进行统一处理。
void handleError(void Function() body) {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (!Constant.inProduction) {
      // debug时，直接将异常信息打印。
      FlutterError.dumpErrorToConsole(details);
    } else {
      // release时，将异常交由zone统一处理。
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  /// 使用runZonedGuarded捕获Flutter未捕获的异常
  runZonedGuarded(body, (Object error, StackTrace stack) async {
    await _reportError(error, stack);
  });
}

Future<void> _reportError(Object error, StackTrace stackTrace) async {
  if (!Constant.inProduction) {
    debugPrintStack(
        stackTrace: stackTrace, label: error.toString(), maxFrames: 100);
  }else{
    /// 将异常信息收集并上传到服务器。可以直接使用类似`flutter_bugly`插件处理异常上报。
  }
}
