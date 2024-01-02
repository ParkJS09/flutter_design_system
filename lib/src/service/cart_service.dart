import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/util/helper/immutable_helper.dart';

class CartService with ChangeNotifier {
  List<CartItem> cartItemList = [];

  List<CartItem> get selectedCartItemList {
    return cartItemList.where((cartItem) => cartItem.isSelected).toImmutable();
  }

  void add(CartItem newCartItem) {
    cartItemList = [...cartItemList, newCartItem].toImmutable();
    notifyListeners();
  }

  void update(int selectedIndex, CartItem newCartItem) {
    cartItemList = cartItemList.asMap().entries.map((entry) {
      return entry.key == selectedIndex ? newCartItem : entry.value;
    }).toImmutable();
    notifyListeners();
  }

  void delete(List<CartItem> deleteList) {
    cartItemList = cartItemList.where((cartItem) {
      return !deleteList.contains(cartItem);
    }).toImmutable();
    notifyListeners();
  }
}
