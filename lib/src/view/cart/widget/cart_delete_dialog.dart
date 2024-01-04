import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/base_dialog.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartDeleteDialog extends StatelessWidget {
  const CartDeleteDialog({super.key, required this.onDeletePressed});

  final void Function() onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: S.current.delete,
      content: Text(
        S.current.deleteDialogDesc,
        style: context.typo.headline6,
      ),
      actions: [
        Button(
          text: S.current.delete,
          width: double.infinity,
          //버튼 텍스트 색상
          color: context.color.onSecondary,
          //버튼 색상
          backgroundColor: context.color.secondary,
          onPressed: () {
            Navigator.pop(context);
            onDeletePressed();
          },
        ),
        const SizedBox(
          height: 12.0,
        ),
        Button(
          text: S.current.cancel,
          type: ButtonType.outline,
          width: double.infinity,
          //버튼 텍스트 색상
          color: context.color.text,
          borderColor: context.color.hint,
          //버튼 색상
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
