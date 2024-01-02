import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/counter_button.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';
import 'package:intl/intl.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({
    super.key,
    required this.product,
    required this.count,
    required this.onCountChanged,
    required this.onAddToCartPressed,
  });

  final Product product;
  final int count;
  final void Function(int count) onCountChanged;
  final void Function() onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      padding: const EdgeInsets.only(
        top: 32.0,
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Wrap(
        runSpacing: 16.0,
        children: [
          Row(
            children: [
              Text(
                S.current.quantity,
                style: context.typo.headline3,
              ),
              const Spacer(),
              CounterButton(count: count, onChanged: onCountChanged)
            ],
          ),
          Row(
            children: [
              Text(
                S.current.totalPrice,
                style: context.typo.headline3,
              ),
              const Spacer(),
              Text(
                IntlHelper.currency(
                  symbol: product.priceUnit,
                  number: product.price * count,
                ),
                style: context.typo.headline3.copyWith(
                  color: context.color.primary,
                ),
              )
            ],
          ),
          Button(
            width: double.infinity,
            size: ButtonSize.large,
            text: S.current.addToCart,
            onPressed: onAddToCartPressed,
          ),
        ],
      ),
    );
  }
}
