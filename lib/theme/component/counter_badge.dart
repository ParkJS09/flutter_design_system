import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class CounterBadge extends StatelessWidget {
  const CounterBadge({
    super.key,
    required this.child,
    required this.label,
    required this.isShow,
  });

  final Widget child;
  final String label;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        //ChildWidget
        child,
        //Badge
        Positioned(
          top: 10.0,
          right: 6.0,
          child: IgnorePointer(
            //자식위젯에서 이벤트를 뺏는 이슈 처리
            ignoring: true,
            child: CircleAvatar(
              backgroundColor: context.color.secondary,
              radius: isShow ? 10 : 0,
              child: Text(
                label,
                style: context.typo.body2.copyWith(
                  color: context.color.onSecondary,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
