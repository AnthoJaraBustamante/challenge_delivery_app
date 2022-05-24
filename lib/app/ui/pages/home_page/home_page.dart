import 'package:challenge_delivery_app/app/ui/pages/detail_page/detail_page.dart';
import 'package:challenge_delivery_app/app/ui/pages/home_page/local_widgets/keep_alive_widget.dart';
import 'package:challenge_delivery_app/app/ui/pages/mapdetails_page/mapdetails_page.dart';
import 'package:challenge_delivery_app/app/ui/pages/ordertracking_page/ordertracking_page.dart';
import 'package:challenge_delivery_app/app/ui/pages/products_page/products_page.dart';
import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/home_controller.dart';

export './bindings/home_binding.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (_) {
          return 
          // PageView(
          //   physics: const BouncingScrollPhysics(),
          //   controller: _.pageController,
          //   scrollDirection: Axis.vertical,
          //   onPageChanged: _.onPageChanged,
          //   children: const <Widget>[
              KeepAlivePage(child: RestaurantPage());
          //     KeepAlivePage(child: DetailPage()),
          //     KeepAlivePage(child: MapDetailsPage()),
          //     KeepAlivePage(child: OrderTrackingPage()),
          //     KeepAlivePage(child: ProductsPage()),
          //   ],
          // );
        },
      ),
    ); 
  }
}
