import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddelivery/data/data.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:fooddelivery/widget/cardscreen.dart';
import 'package:fooddelivery/widget/recentorders.dart';
import 'package:fooddelivery/widget/restaurantdetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  buildRestaurent() {
    List<Widget> restaurentList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurentList.add(GestureDetector(
        onTap: (() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RastautantDetails(
                    restaurant: restaurant,
                  )));
        }),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Image(
                    image: AssetImage('${restaurant.imageUrl}'),
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text('${restaurant.name}'),
                  Text('${restaurant.address}'),
                  Text('Map'),
                ],
              )
            ],
          ),
        ),
      ));
    });
    return Column(
      children: restaurentList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle,
          ),
        ),
        title: Text("Food Zone..."),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CardScreen()));
              },
              child: Text(
                '(${currentUser.cart!.length})',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(9),
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: "Search...",
                suffixIcon: Icon(Icons.close)),
          ),
          Text("Recent Orders..."),
          RecentOrders(),
          Column(
            children: [
              Text("Near by Restaurant"),
              buildRestaurent(),
            ],
          )
        ],
      ),
    );
  }
}
