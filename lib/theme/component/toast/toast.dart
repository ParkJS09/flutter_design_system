import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/main.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast_builder.dart';

abstract class Toast {
  static void show(
    String text, {
    Duration duration = const Duration(
      seconds: 3,
    ),
  }) async {
    //MyApp(MaterialApp)이 정상적으로 위젯트리에 붙지 않을 경우 null이 리턴될 수 있음.
    BuildContext? context = MyApp.navigatorKey.currentContext;
    if (context == null) return;
    GlobalKey<ToastBuilderState> toastKey = GlobalKey();
    final overlay = Overlay.of(context);
    const animDuration = Duration(milliseconds: 333);
    final toast = OverlayEntry(
      builder: (context) => ToastBuilder(
        key: toastKey,
        text: text,
        animDuration: animDuration,
      ),
    );
    overlay.insert(toast);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      toastKey.currentState?.isShow = true;
    });

    await Future.delayed(duration);
    toastKey.currentState?.isShow = false;
    await Future.delayed(animDuration);
    toast.remove();
  }
}
