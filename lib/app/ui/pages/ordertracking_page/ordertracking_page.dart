
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/ordertracking_controller.dart';

export './bindings/ordertracking_binding.dart';


class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderTrackingController controller =  Get.find<OrderTrackingController>();
    
    return Scaffold(
        body: SafeArea(
        child:  Column(
          children: const <Widget>[
            Text('OrderTracking Page'),
          ],
        ),
      ),
    );
  }
}
  