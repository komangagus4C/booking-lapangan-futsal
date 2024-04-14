import 'package:flutter/material.dart';

import 'drawer.dart'; // import the file containing MyHeaderDrawer

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text(
          'Plante Futsal Kenyeri 120k/jam',
          style: TextStyle(fontSize: 24),
        ),
      ),
      drawer: Drawer(
        child: MyHeaderDrawer(), // use MyHeaderDrawer here
      ),
    );
  }
}