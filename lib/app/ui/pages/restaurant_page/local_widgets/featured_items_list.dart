import 'package:challenge_delivery_app/app/data/models/product.dart';
import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/local_widgets/featured_item_card.dart';
import 'package:flutter/material.dart';

class FeaturedItems extends StatelessWidget {
  final List<Product> products;

  const FeaturedItems({Key? key, required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 180,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          Product featuredProduct = products[index];
          return FeaturedItemCard(
            product: featuredProduct,
            isDark: isDark,
          );
        },
      ),
    );
  }
}
