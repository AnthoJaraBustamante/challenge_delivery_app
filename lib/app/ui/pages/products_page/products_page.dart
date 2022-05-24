
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/products_controller.dart';

export './bindings/products_binding.dart';


class ProductsPage extends StatelessWidget {
  const ProductsPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsController controller =  Get.find<ProductsController>();
    
    return Scaffold(
        body: SafeArea(
        child:  Column(
          children: const <Widget>[
            Text('Products Page'),
          ],
        ),
      ),
    );
  }
}
  