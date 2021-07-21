     

import 'package:flutter/foundation.dart';


class CartItem {
  final String? id;
  final String? title;
  final int? quantity;
  final double? price;

  CartItem(
      { // with ({named arguments}), with (positionals arguments)
      required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {};

  Map<String, CartItem> get items {
    return {..._items!};
  }

  int get itemCount {                               //get permet de pouvoir accéder à la propriété depuis ailleurs
    return _items!.length;                          //c'est un moyen plus éconnome que d'écrire une fonction. 
  }

  double get totalAmount {            
    var total = 0.0;
    _items!.forEach((key,cartItem) => {
      total += cartItem.price! * cartItem.quantity!//Pourquoi est-ce qu'il n'y a pas de ";" ici ?
      });
    return total; 
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items!.containsKey(productId)) {
      // change quantity
      _items!.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity! + 1,
        ),
      );
    } else {
      _items!.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
  void removeItem(String productId){
    _items!.remove(productId);
    notifyListeners();  
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
