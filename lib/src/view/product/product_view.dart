import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_bottom_sheet.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_color_preview.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_desc.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/color_picker.dart';
import 'package:house_of_tomorrow/theme/component/counter_button.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  //선택한 수량
  int count = 1;
  int colorIndex = 0;
  void onCountChanged(int newCount) {
    setState(() {
      count = newCount;
      print('count -> $count');
    });
  }

  void onColorIndexChanged(int newColorIndex) {
    setState(() {
      colorIndex = newColorIndex;
    });
  }

  void onAddToCartPressed() {
    final CartService cartService = context.read();
    final CartItem newCartItem = CartItem(
      product: widget.product,
      colorIndex: colorIndex,
      count: count,
      isSelected: true,
    );
    cartService.add(newCartItem);
    Toast.show(context, S.current.productAdded(widget.product.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.product),
        leading: const PopButton(),
        // 타이틀 여백 제거
        titleSpacing: 0.0,
        actions: const [
          CartButton(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
              ),
              child: Wrap(
                runSpacing: 32.0,
                alignment: WrapAlignment.center,
                children: [
                  ProductColorPreview(
                    colorIndex: colorIndex,
                    product: widget.product,
                  ),
                  ColorPicker(
                    colorIndex: colorIndex,
                    colorList: widget.product.productColorList.map((e) {
                      return e.color;
                    }).toList(),
                    onColorSelected: onColorIndexChanged,
                  ),
                  ProductDesc(
                    product: widget.product,
                  ),
                ],
              ),
            ),
          ),
          ProductBottomSheet(
            product: widget.product,
            count: count,
            onCountChanged: onCountChanged,
            onAddToCartPressed: onAddToCartPressed,
          ),
        ],
      ),
    );
  }
}
