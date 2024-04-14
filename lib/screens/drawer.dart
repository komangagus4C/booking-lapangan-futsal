import 'package:flutter/material.dart';
import 'package:my_app/booking/data_booking.dart';
import 'package:my_app/news_feed.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: const Color.fromARGB(255, 116, 121, 125),
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  height: 70.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                ),
                const Text("Komang Agus 4C", style: TextStyle(color: Colors.white, fontSize: 20),),
              ],
            ),
          ),
          ListTile(
            title:  Text('API'),
            onTap: () {
              // Navigate to the new screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsFeed()),
              );
            },
          ),
          ListTile(
            title: const Text('Komang Agus'),
            onTap: () {
              // Navigate to the new screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}