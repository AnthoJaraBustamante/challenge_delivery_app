import 'package:challenge_delivery_app/app/data/models/product.dart';
import 'package:challenge_delivery_app/app/ui/global_widgets/favorite_icon_button.dart';
import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/controllers/restaurant_controller.dart';
import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/local_widgets/featured_item_card.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
    required this.controller,
    required this.width,
    required this.isDark,
  }) : super(key: key);

  final RestaurantController controller;
  final double width;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.productsByCategory.length,
        itemBuilder: (BuildContext context, int index) {
          Product product = controller.productsByCategory[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: width * 0.57,
              child: Column(
                children: [
                  Expanded( 
                    flex: 3,
                    child: Stack(
                      children: [
                        ProductBgImage(
                          product: product,
                          width: width * 0.57,
                          height: 250,
                        ),
                        Row(
                          children: [
                            ProductPrice(
                              isDark: isDark,
                              product: product,
                            ),
                            const Spacer(),
                            FavoriteIconButton(
                              isFavorite: product.isFavorite,
                              onTap: () {
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
                      ],
                    ),
                  ),
                  ProductNameDescription(
                    isDark: isDark,
                    product: product,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
