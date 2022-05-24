
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/detail_controller.dart';

export './bindings/detail_binding.dart';

class DetailPage extends StatelessWidget {
  const DetailPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailController controller =  Get.find<DetailController>();
    
    return Scaffold(
        body: SafeArea(
        child:  Column(
          children: const <Widget>[
            Text('Detail Page'),
          ],
        ),
      ),
    );
  }
}
  