import 'package:flutter/material.dart';

class CartState with ChangeNotifier{
  final List<String> _cart = ['laranja', 'maca', 'banana'];
    
  int get count => _cart.length;
   
  List<String> get cart => _cart;

  void addItem(String item) {
    _cart.add(item);
    notifyListeners();
  }
    void removeItem(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }
}
