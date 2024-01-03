import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';
import 'package:house_of_tomorrow/theme/component/counter_button.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onPressed,
    required this.onCountChanged,
  });

  final CartItem cartItem;
  final void Function() onPressed;
  final void Function(int count) onCountChanged;
  @override
  Widget build(BuildContext context) {
    final productColor = cartItem.product.productColorList[cartItem.colorIndex];
    return GestureDetector(
      //빈영역 클릭시에도 이벤트를 처리할 수 있도록 하는 옵션
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    width: 92.0,
                    height: 92.0,
                    imageUrl: productColor.imageUrl,
                    fit: BoxFit.cover,
                    color: context.color.background,
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
                AssetIcon(
                  cartItem.isSelected ? 'check' : 'uncheck',
                  color: cartItem.isSelected
                      ? context.color.primary
                      : context.color.inactive,
                ),
              ],
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name.toString(),
                    style: context.typo.headline5,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Text(
                        IntlHelper.currency(
                          symbol: cartItem.product.priceUnit,
                          number: cartItem.product.price * cartItem.count,
                        ),
                        style: context.typo.subtitle1.copyWith(
                          color: context.color.subtext,
                        ),
                      ),
                      const Spacer(),
                      CounterButton(
                        count: cartItem.count,
                        onChanged: onCountChanged,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
