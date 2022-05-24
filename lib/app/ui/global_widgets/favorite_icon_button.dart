import 'package:challenge_delivery_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    Key? key,
    required this.isFavorite,
    this.onTap,
  }) : super(key: key);

  final bool isFavorite;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          isFavorite ? ColorTheme.darkTertiary : Colors.black.withOpacity(0.5),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 25,
          width: 25,
          alignment: Alignment.center,
          child: const Icon(
            Icons.favorite,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}