// ignore_for_file: library_private_types_in_public_apis
import 'package:flutter/material.dart';
import 'package:my_app/components/asset_image_widget.dart';
import 'package:my_app/screens/booking_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _count = 0;
  final String imageUrl = 'https://picsum.photos/250?image=9';

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: AssetImageWidget(
                imagePath: 'assets/images/2017-01-23.jpg',
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('8-9AM'))),
                SizedBox(
                    width:
                        30), // Spasi horizontal antara kotak pertama dan kedua
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('9-10AM'))),
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('10-11AM'))),
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('11-12PM'))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('12-13PM'))),
                SizedBox(
                    width:
                        30), // Spasi horizontal antara kotak pertama dan kedua
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('13-14PM'))),
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('14-15PM'))),
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('15-16PM'))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('16-17PM'))),
                SizedBox(
                    width:
                        30), // Spasi horizontal antara kotak pertama dan kedua
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('17-18PM'))),
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('18-19PM'))),
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('19-20PM'))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 120),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('20-21PM'))),
                SizedBox(width: 30),
                Container(
                    width: 60,
                    height: 50,
                    color: Colors.grey,
                    child: Center(child: Text('21-22PM'))),
              ],
            ),
            SizedBox(height: 30),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingScreen()),
                );
              },
              child: Container(
                width: 150,
                height: 50,
                color: Color.fromARGB(255, 156, 246, 199),
                child: Center(
                  child: Text(
                    'BOOKING',
                  ),
                ),
              ),
            ),
            SizedBox(height: 80),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '*Bayar langsung di lapangan',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

