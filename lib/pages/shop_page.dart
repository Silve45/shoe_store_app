import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart method
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user, shoe is added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("successfully added"),
          content: Text("check your cart"),
        ),

    );

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                //search bar
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Row(
                    // remove const if it breaks
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "search (not functional)",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                //message
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    "everyone is flies.. some fly longer than others - MJ",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),

                //hot picks
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hot Picks ⭐",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Expanded(
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        //'lib/images/logo.png'
                        //get a shoe from the list
                        Shoe shoe = value.getShoeList()[index];

                        //return the shoe
                        return ShoeTile(
                          shoe: shoe,
                          onTap: () => addShoeToCart(shoe),
                        );
                      }),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 25.0, right: 25.0, left: 25.0),
                  child: Divider(
                    color: Colors.transparent, //was white
                  ),
                )
              ],
            ));
  }
}
