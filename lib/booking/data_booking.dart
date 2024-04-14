// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:my_app/booking/edit.dart';
import 'package:my_app/booking/new_booking.dart';
import 'package:my_app/helper/db_helper.dart';
import 'package:my_app/booking/presenter_data.dart';
import 'package:my_app/utils/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<nanam> nanamList = [];

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Lapangan Booking'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: createListView(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
        tooltip: 'Input Tanaman',
        onPressed: () async {
          var nanam = await navigateToEntryForm(context);
          if (nanam != null) addtanaman(nanam);
        },
      ),
    );
  }

  Future<nanam?> navigateToEntryForm(BuildContext context) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return InputBooking(nanam(0, '', '', '')); // Create a new Resep object
      }),
    );
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1!;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: Text(
              nanamList[index].nama_tanaman,
              style: textStyle,
            ),
            subtitle: Text(nanamList[index].jenis_tanaman),
            trailing: Wrap(
              spacing: 12, // space between two icons
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    var nanam = await navigateToEditResepForm(
                        context, nanamList[index]);
                    if (nanam != null) edittanaman(nanam);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deletetanaman(nanamList[index]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<nanam?> navigateToEditResepForm(
      BuildContext context, nanam nanam) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return EditBooking(booking: nanam);
      }),
    );
  }

  void addtanaman(nanam nanam) async {
    int result = await dbHelper.insert(nanam);
    if (result > 0) {
      updateListView();
    }
  }

  void edittanaman(nanam nanam) async {
    int result = await dbHelper.update(nanam);
    if (result > 0) {
      updateListView();
      print("Edit Booking RESULT: $result");
    }
  }

  void deletetanaman(nanam nanam) async {
    int result = await dbHelper.delete(nanam.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<nanam>> tanamanListFuture = dbHelper.getnanamList();
      tanamanListFuture.then((nanamList) {
        setState(() {
          this.nanamList = nanamList;
          this.count = nanamList.length;
        });
      });
    });
  }
}
