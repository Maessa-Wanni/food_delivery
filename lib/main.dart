import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,

    );
  }
}

