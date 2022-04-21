import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    _items.putIfAbsent(product.id!, () {
      print("add item to cart");
      return CartModel(
        id: product.id,
        img: product.img,
        name: product.name,
        price: product.price,
        quantity: quantity,
        isExit: true,
        time: DateTime.now().toString(),
      );
    });
  }
}
