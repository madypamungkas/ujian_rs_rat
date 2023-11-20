import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SisDialogConnection extends StatelessWidget {
  const SisDialogConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: AlertDialog(
          title: const Text("Koneksi Terputus"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Koneksi internet anda terputus'),
                const Text(
                    'Pastikan ponsel anda mempunyai koneksi internet'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        onWillPop: () async => false);
  }
}
