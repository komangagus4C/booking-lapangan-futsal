import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/foto-komang.jpg'),
            ),
            SizedBox(height: 50),
            Text(
              'Nama: Komang Agus',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Umur: 20',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'E-mail: agus.suwidia@student.ac.id',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'No. Hp: 08555555',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}