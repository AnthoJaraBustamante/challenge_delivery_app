
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/mapdetails_controller.dart';

export './bindings/mapdetails_binding.dart';


class MapDetailsPage extends StatelessWidget {
  const MapDetailsPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapDetailsController controller =  Get.find<MapDetailsController>();
    
    return Scaffold(
        body: SafeArea(
        child:  Column(
          children: const <Widget>[
            Text('MapDetails Page'),
          ],
        ),
      ),
    );
  }
}
  