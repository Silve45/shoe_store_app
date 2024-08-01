import 'package:flutter/material.dart';
import 'package:shoe_store_app/components/bottom_nav_bar.dart';

import 'cart_page.dart';
import 'shop_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //the int to keep track of selected index
  int _selectedIndex = 0;

  //this method to update selected index
  //when the user taps the bottom bar

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;

    });
  }

  //pages to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),

      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              onPressed:(){
                Scaffold.of(context).openDrawer();

              } ,

              );
          }
        ),

      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
            children: [
              //logo
              Theme(
                data: Theme.of(context).copyWith(
                    dividerTheme: const DividerThemeData(color: Colors.transparent)
                ),
                child: DrawerHeader(
                    child: Image.asset(
                      'lib/images/logo.png',
                      color: Colors.white,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: Colors.grey[800] ,),
              ),

              //other pages
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.white,),
                  title:Text("home", style: TextStyle(color: Colors.white),) ,
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.white,),
                  title:Text("about", style: TextStyle(color: Colors.white),) ,
                ),
              ),
            ],
          ),


          const Padding(
            padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.white,),
              title:Text("logout", style: TextStyle(color: Colors.white),) ,
            ),
          )

        ],),

      ),
      body: _pages[_selectedIndex],

    );
  }
}

