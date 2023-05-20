import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_task/ui/pages/home_page.dart';
import 'package:flutter_task/utils/extensions.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Task',
      home: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig.init(constraints, orientation);
              return HomePage();
            },
          );
        },
      ),
    );
  }
}
