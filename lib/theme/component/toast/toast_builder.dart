//UI를 그리고 Overlay로 전달

import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class ToastBuilder extends StatelessWidget {
  const ToastBuilder({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: screenSize.height * 0.15,
      left: 0,
      right: 0,
      child: Center(
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
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
