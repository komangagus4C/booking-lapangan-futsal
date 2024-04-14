import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:my_app/booking/presenter_data.dart';

class EditBooking extends StatefulWidget {
  final nanam booking;

  EditBooking({required this.booking});

  @override
  _EditBookingState createState() => _EditBookingState();
}

class _EditBookingState extends State<EditBooking> {
  final format = DateFormat("yyyy-MM-dd");
  TextEditingController _namaController = TextEditingController();
  TextEditingController _jenisController = TextEditingController();
  DateTime? _tanggalmenanam;

  @override
  void initState() {
    super.initState();
    _namaController.text = widget.booking.nama_tanaman;
    _jenisController.text = widget.booking.jenis_tanaman;
    _tanggalmenanam = DateTime.parse(widget.booking.tanggal_menanam);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Booking'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama Penyewa'),
              ),
              SizedBox(height: 10),
              SizedBox(height: 30),
              DateTimeField(
                format: format,
                initialValue: _tanggalmenanam,
                decoration: InputDecoration(
                  labelText: "Tanggal Menyewa",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2045),
                  );
                },
                onChanged: (selectedDate) {
                  setState(() {
                    _tanggalmenanam = selectedDate;
                  });
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(double.infinity, 50), // Lebar minimum tombol
                  ),
                  child:
                      Text('Simpan Perubahan', style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(double.infinity, 50), // Lebar minimum tombol
                  ),
                  child: Text('Batal', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    // Mendapatkan nilai terbaru dari TextFormField
    String namatanaman = _namaController.text;
    String jenistanaman = _jenisController.text;
    String tanggalmenanam = _tanggalmenanam != null
        ? format.format(_tanggalmenanam!)
        : widget.booking.tanggal_menanam;

    // Membuat objek Resep baru dengan nilai terbaru
    nanam updatedTanaman = nanam(
      widget.booking.id,
      namatanaman,
      jenistanaman,
      tanggalmenanam,
    );

    // Mengembalikan nilai Resep yang diperbarui ke halaman sebelumnya
    Navigator.pop(context, updatedTanaman);
  }
}
