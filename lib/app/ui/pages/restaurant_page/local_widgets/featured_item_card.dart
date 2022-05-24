import 'package:auto_size_text/auto_size_text.dart';
import 'package:challenge_delivery_app/app/data/models/product.dart';
import 'package:challenge_delivery_app/app/ui/global_widgets/favorite_icon_button.dart';
import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/controllers/restaurant_controller.dart';
import 'package:challenge_delivery_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

class FeaturedItemCard extends StatelessWidget {
  const FeaturedItemCard({
    Key? key,
    required this.product,
    required this.isDark,
  }) : super(key: key);
  final Product product;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double width = size.width * 0.7;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ProductBgImage(product: product, width: width),
                SizedBox(
                  width: size.width * 0.7,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductPrice(isDark: isDark, product: product),
                      const Spacer(),
                      FavoriteIconButton(
                        isFavorite: product.isFavorite,
                        onTap: () {
                          final controller = Get.find<RestaurantController>();
                          product.isFavorite = !product.isFavorite;
                          controller.update(<String>[
                            'featured',
                            'categories', 
                            'products',
                          ]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductNameDescription(
                  product: product,
                  isDark: isDark,
                ),
                _ProductRating(isDark: isDark, product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ProductRating extends StatelessWidget {
  const _ProductRating({
    Key? key,
    required this.isDark,
    required this.product,
  }) : super(key: key);
  final bool isDark;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 28,
      decoration: BoxDecoration(
        gradient: isDark
            ? ColorTheme.primaryDarkGradient
            : ColorTheme.primaryGradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${product.rating}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 10,
          ),
          Text(
            '(${product.ratingCount}+)',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductNameDescription extends StatelessWidget {
  const ProductNameDescription({
    Key? key,
    required this.product,
    required this.isDark,
  }) : super(key: key);
  final Product product;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            product.name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = isDark
                    ? ColorTheme.primaryDarkShaderGradient
                    : ColorTheme.primaryShaderGradient,
            ),
          ),
          const SizedBox(height: 5),
          AutoSizeText(
            product.description,
            maxLines: 2,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isDark
                  ? Colors.white.withOpacity(0.6)
                  : Colors.black.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    Key? key,
    required this.isDark,
    required this.product,
  }) : super(key: key);
  final bool isDark;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // stops: const [0.3, 0.75],
                colors: [
                  ColorTheme.darkSecondary.withOpacity(0.86),
                  ColorTheme.darkSecondary.withOpacity(0.86),
                ],
              )
            : ColorTheme.primaryGradient,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '\$',
              style: TextStyle(
                color: isDark
                    ? ColorTheme.darkQuaternary
                    : Colors.white.withOpacity(0.88),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: product.priceString,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.white.withOpacity(0.88),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductBgImage extends StatelessWidget {
  const ProductBgImage({
    Key? key,
    required this.product,
    required this.width,
    this.height,
  }) : super(key: key);
  final Product product;
  final double width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image(
        image: PCacheImage(
          product.imageUrl,
          enableInMemory: true,
        ),
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
