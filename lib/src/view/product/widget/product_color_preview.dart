import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class ProductColorPreview extends StatelessWidget {
  const ProductColorPreview(
      {super.key, required this.colorIndex, required this.product});

  final int colorIndex;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: context.deco.shadow,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: 32.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            //폭과 높이 비율 지정
            child: AspectRatio(
              aspectRatio: 1 / 0.8,
              child: CachedNetworkImage(
                imageUrl: product.productColorList[colorIndex].imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            product.name.toString(),
            style: context.typo.headline1.copyWith(
              fontWeight: context.typo.semiBold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Row(
            children: [
              Text(
                product.brand.toString(),
                style: context.typo.subtitle1.copyWith(
                  fontWeight: context.typo.light,
                  color: context.color.subtext,
                ),
              ),
              const Spacer(),
              Text(
                IntlHelper.currency(
                  symbol: product.priceUnit,
                  number: product.price,
                ),
                style: context.typo.headline6.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
