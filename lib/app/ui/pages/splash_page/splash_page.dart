import 'package:challenge_delivery_app/app/ui/theme/color_theme.dart';
import 'package:challenge_delivery_app/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/splash_controller.dart';

export './bindings/splash_binding.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: ColorTheme.splashGradient,
            ),
          ),
          GetBuilder<SplashController>(
            init: SplashController(),
            initState: (_) {},
            builder: (_) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(Assets.assetsSplash, fit: BoxFit.contain),
              );
            },
          ),
        ],
      ),
    );
  }
}
