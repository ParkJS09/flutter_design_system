//UI를 그리고 Overlay로 전달

import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class ToastBuilder extends StatefulWidget {
  const ToastBuilder({
    super.key,
    required this.text,
    required this.animDuration,
  });

  final String text;
  final Duration animDuration;

  @override
  State<ToastBuilder> createState() => ToastBuilderState();
}

//외부에서 접근하기 위하여 ToastBuilderState를 전역으로 수정
class ToastBuilderState extends State<ToastBuilder> {
  bool _isShow = false;

  bool get isShow => _isShow;

  set isShow(bool value) {
    setState(() {
      _isShow = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: screenSize.height * 0.15,
      left: 0,
      right: 0,
      child: Center(
        child: AnimatedOpacity(
          duration: widget.animDuration,
          opacity: isShow ? 1 : 0,
          child: Container(
            decoration: BoxDecoration(
              color: context.color.toastContainer,
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16.0,
            ),
            child: DefaultTextStyle(
              style: context.typo.headline6.copyWith(
                color: context.color.onToastContainer,
              ),
              child: Text(widget.text),
            ),
          ),
        ),
      ),
    );
  }
}
