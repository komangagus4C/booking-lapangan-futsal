// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:my_app/booking/presenter_data.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class InputBooking extends StatefulWidget {
  final nanam booking;

  InputBooking(this.booking);

  @override
  _InputBookingState createState() => _InputBookingState(this.booking);
}

class _InputBookingState extends State<InputBooking> {
  nanam booking;
  TextEditingController namaBookingController = TextEditingController();
  TextEditingController tanggalMenyewaController = TextEditingController();
  final format = DateFormat('yyyy-MM-dd');

  _InputBookingState(this.booking);

  @override
  Widget build(BuildContext context) {
    namaBookingController.text = booking.nama_tanaman;
    tanggalMenyewaController.text = booking.tanggal_menanam;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Booking"),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: namaBookingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nama Penyewa",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  DateTimeField(
                    controller: tanggalMenyewaController,
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2045),
                      );
                    },
                    decoration: InputDecoration(
                      labelText: "Tanggal Menyewa",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColorLight,
                        backgroundColor: Theme.of(context).primaryColorDark,
                      ),
                      child: Text("Simpan", textScaleFactor: 1.5),
                      onPressed: () {
                        booking.nama_tanaman = namaBookingController.text;
                       booking.tanggal_menanam = tanggalMenyewaController.text;
                        print("Sudah di Update");
                        Navigator.pop(context, booking);
                      },
                    ),
                  ),
                  Container(width: 5.0),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColorLight,
                        backgroundColor: Theme.of(context).primaryColorDark,
                      ),
                      child: Text("Batal", textScaleFactor: 1.5),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
