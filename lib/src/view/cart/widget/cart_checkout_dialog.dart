import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/base_dialog.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartCheckoutDialog extends StatelessWidget {
  const CartCheckoutDialog({super.key, required this.onCheckoutPressed});

  final void Function() onCheckoutPressed;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: S.current.checkout,
      content: Text(
        S.current.checkoutDialogDesc,
        style: context.typo.headline6,
      ),
      actions: [
        Button(
          text: S.current.checkout,
          width: double.infinity,
          //버튼 텍스트 색상
          color: context.color.onSecondary,
          //버튼 색상
          backgroundColor: context.color.primary,
          onPressed: () {
            Navigator.pop(context);
            onCheckoutPressed();
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
