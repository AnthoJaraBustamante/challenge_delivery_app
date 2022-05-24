import 'package:challenge_delivery_app/app/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(8));
    return Container(
      margin: const EdgeInsets.all(8),
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: InkWell(
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              gradient: Theme.of(context).brightness == Brightness.light
                  ? ColorTheme.primaryGradient
                  : ColorTheme.primaryDarkGradient,
              // Theme.of(context).brightness == Brightness.light ?  Color(0xFFD3D3D3) : Colors.red,
              borderRadius: borderRadius,
            ),
            child: const SizedBox(
              height: 35,
              width: 35,
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTagButton extends StatelessWidget {
  const MyTagButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(5));
    return Container(
      margin: const EdgeInsets.all(8),
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: InkWell(
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              gradient: Theme.of(context).brightness == Brightness.light
                  ? ColorTheme.primaryGradient
                  : ColorTheme.primaryDarkGradient,
              // Theme.of(context).brightness == Brightness.light ?  Color(0xFFD3D3D3) : Colors.red,
              borderRadius: borderRadius,
            ),
            child: Container(
              padding: const EdgeInsets.all(5),
              child:   Center(
                child: Text(
                  text.toUpperCase(),
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
