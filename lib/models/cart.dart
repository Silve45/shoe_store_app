import 'package:flutter/cupertino.dart';
import 'package:shoe_store_app/models/shoe.dart';

class Cart extends ChangeNotifier{
  //list of shoes for sale
  List<Shoe> shopShop = [
    Shoe(
        name: "Zoom Fr",
        price: "236",
        imagePath: "lib/images/shoe1.png",
        description: "beasst"),

    Shoe(
        name: "jordam",
        price: "246",
        imagePath: "lib/images/shoe2.png",
        description: "nice shoe"),

    Shoe(
        name: "curry",
        price: "116",
        imagePath: "lib/images/shoe3.png",
        description: "very nice shoe"),

    Shoe(
        name: "kyrice",
        price: "456",
        imagePath: "lib/images/shoe4.png",
        description: "cool cool"),
  ];

//list of items in user cart
  List<Shoe> userCart = [];

//get list of shoes for sale
  List<Shoe> getShoeList() {
    return shopShop;
  }

//get cart
  List<Shoe> getUserCart(){
    return userCart;
  }

//add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

//remove item from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }

}
