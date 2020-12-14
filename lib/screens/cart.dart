import 'package:flutter/cupertino.dart';

class CartItem {
  final String id, title;
  final double price;
  final int quantity;
  CartItem(
      {@required this.id,
      @required this.title,
      @required this.price,
      this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return  _items.length;
  }

  void addItem(String productId, double price, String title) {
    if (items.containsKey(productId)) {
      items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              quantity: value.quantity + 1));
    } else {
      items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }
}
