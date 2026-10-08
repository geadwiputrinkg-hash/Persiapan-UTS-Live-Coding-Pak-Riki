import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const KalkulatorSederhana();
  }
}

class KalkulatorSederhana extends StatefulWidget {
  const KalkulatorSederhana({super.key});

  @override
  State<KalkulatorSederhana> createState() => _KalkulatorSederhanaState();
}

class _KalkulatorSederhanaState extends State<KalkulatorSederhana> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String hasil = '';

  void _hitung() {
    if (_formKey.currentState!.validate()) {
      double angka1 = double.parse(_angka1Controller.text);
      double angka2 = double.parse(_angka2Controller.text);
      double total = angka1 + angka2;

      setState(() {
        hasil = total.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Kalkulator Penjumlahan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Input Angka 1
                TextFormField(
                  controller: _angka1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Angka 1',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan angka pertama';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                // Input Angka 2
                TextFormField(
                  controller: _angka2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Angka 2',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan angka kedua';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                // Tombol Proses Hitung
                Center(
                  child: ElevatedButton(
                    onPressed: _hitung,
                    child: const Text('Proses Hitung'),
                  ),
                ),
                const SizedBox(height: 20),
                // Hasil Penjumlahan
                Center(
                  child: Text(
                    'Hasil penjumlahan: $hasil',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Tombol Kembali Ke Menu
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back To Menu'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}