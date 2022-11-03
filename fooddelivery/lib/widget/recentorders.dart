import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddelivery/data/data.dart';
import 'package:fooddelivery/model/order.dart';

class RecentOrders extends StatefulWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  State<RecentOrders> createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  buildRecentOrder(Order order) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: 310,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage('${order.food!.imageUrl}'),
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${order.food!.name}'),
                Text('${order.restaurant!.name}'),
                Text('${order.date}'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          //color: Colors.blue,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.Orders!.length,
              itemBuilder: (context, index) {
                Order order = currentUser.Orders![index];

                return buildRecentOrder(order);
              }),
        )
      ],
    );
  }
}
