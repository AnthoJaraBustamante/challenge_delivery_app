import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/controllers/restaurant_controller.dart';
import 'package:challenge_delivery_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key, required this.controller}) : super(key: key);

  final RestaurantController controller;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 50,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.toList().length,
        itemBuilder: (BuildContext context, int index) {
          final category = controller.categories.toList()[index];
          MapEntry<String, bool> entry = category.entries.first;

          return InkWell(
            onTap: () {
              controller.setCategory(entry.key);
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              child: Container(
                height: 30,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectBorderColor(entry, isDark),
                    width: 1.2,
                  ),
                  boxShadow: isDark
                      ? null
                      : <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(1, 4),
                            blurRadius: 5,
                          ),
                        ],
                  borderRadius: BorderRadius.circular(5),
                  color: selectColor(entry, isDark),
                  gradient: selectGradient(entry, isDark),
                ),
                child: Text(
                  entry.key,
                  style: TextStyle(
                    color: selectTextColor(entry, isDark),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color selectTextColor(MapEntry<String, bool> entry, bool isDark) {
    if (entry.value) {
      return Colors.white;
    }
    return isDark
        ? Colors.white.withOpacity(0.5)
        : Colors.black.withOpacity(0.4);
  }

  Color selectBorderColor(MapEntry<String, bool> entry, bool isDark) {
    if (entry.value) {
      return Colors.transparent;
    }
    if (!isDark) {
      return Colors.black.withOpacity(0.1);
    }
    return Colors.white.withOpacity(0.5);
  }

  Color selectColor(MapEntry<String, bool> entry, bool isDark) {
    if (isDark) {
      return entry.value ? ColorTheme.darkTertiary : Colors.transparent;
    }
    return entry.value ? ColorTheme.primaryAccent : ColorTheme.darkSeptenary;
  }

  Gradient? selectGradient(MapEntry<String, bool> entry, bool isDark) {
    if (!isDark) {
      return entry.value ? ColorTheme.primaryGradient : null;
    }
    return null;
  }
}
