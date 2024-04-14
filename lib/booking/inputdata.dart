import 'package:flutter/material.dart';
import 'package:my_app/service/data_service.dart';

class InputApi extends StatefulWidget {
  const InputApi({Key? key}) : super(key: key);

  @override
  _InputApiState createState() => _InputApiState();
}

class _InputApiState extends State<InputApi> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        backgroundColor: const Color.fromARGB(255, 86, 104, 226),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Judul',
                hintText: 'Judul',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _bodyController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Deskripsi',
                hintText: 'Deskripsi',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _postEvent();
              },
              child: const Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }

  void _postEvent() {
    String title = _titleController.text;
    String body = _bodyController.text;
    if (title.isNotEmpty && body.isNotEmpty) {
      setState(() {
        Dataservice.postEvent(title, body);
        Navigator.of(context).pop();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Judul dan Deskripsi tidak boleh kosong.'),
        ),
      );
    }
  }
}