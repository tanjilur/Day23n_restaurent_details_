import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddelivery/data/data.dart';
import 'package:fooddelivery/model/food.dart';
import 'package:fooddelivery/model/restaurant.dart';

class RastautantDetails extends StatefulWidget {
  Restaurant? restaurant;

  RastautantDetails({this.restaurant});

  @override
  State<RastautantDetails> createState() => _RastautantDetailsState();
}

class _RastautantDetailsState extends State<RastautantDetails> {
  buildMenuItem(Food MenuItem) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  '${MenuItem.imageUrl}', ///////////
                )),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 20,
          child: Column(
            children: [
              Text(
                '${MenuItem.name}',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                '\$ ${MenuItem.price}',
                style: TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Image(
              image: AssetImage('${widget.restaurant?.imageUrl}'),
              height: 210,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    )),
              ],
            ),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.restaurant?.name}'),
                    Text('${widget.restaurant?.address}'),
                  ],
                ),
                Icon(Icons.location_city)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Review",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Contact",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Text("Menu", style: TextStyle(color: Colors.pink, fontSize: 20)),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.restaurant!.menu!.length, (index) {
                Food food = widget.restaurant!.menu![index];
                return buildMenuItem(food);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
