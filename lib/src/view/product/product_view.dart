import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_color_preview.dart';
import 'package:house_of_tomorrow/theme/component/color_picker.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

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
  int _count = 1;
  int _colorIndex = 0;
  void onCountChanged(int newCount) {
    setState(() {
      _count = newCount;
    });
  }

  void oncolorIndexChanged(int newColorIndex) {
    setState(() {
      _colorIndex = newColorIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.product),
        leading: const PopButton(),
        // 타이틀 여백 제거
        titleSpacing: 0.0,
      ),
      body: Wrap(
        runSpacing: 32.0,
        alignment: WrapAlignment.center,
        children: [
          ProductColorPreview(
            colorIndex: _colorIndex,
            product: widget.product,
          ),
          ColorPicker(
            colorIndex: _colorIndex,
            colorList: widget.product.productColorList.map((e) {
              return e.color;
            }).toList(),
            onColorSelected: oncolorIndexChanged,
          ),
        ],
      ),
    );
  }
}
