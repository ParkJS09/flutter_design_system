import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_card.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';

class ProductCardGrid extends StatelessWidget {
  const ProductCardGrid(
    this.productList, {
    super.key,
  });

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      //한 줄에 노출될 그리드 아이템
      crossAxisCount: context.layout(
        2,
        tablet: 3,
        desktop: 4,
      ),
      //아이템간의 세로 간격
      mainAxisSpacing: 24,
      //아이템간의 가로 간격
      crossAxisSpacing: 16,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      //전체 아이템의 갯수
      itemCount: productList.length,
      //노출되어질 아이템
      itemBuilder: (context, index) {
        final product = productList[index];
        return ProductCard(product: product);
      },
    );
  }
}
