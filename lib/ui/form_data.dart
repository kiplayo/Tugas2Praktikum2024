import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textboxNama(),
              SizedBox(height: 10),
              _textboxNIM(),
              SizedBox(height: 10),
              _textboxTahun(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama",
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
      controller: _namaController,
    );
  }

  Widget _textboxNIM() {
    return TextField(
      decoration: InputDecoration(
        labelText: "NIM",
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
      controller: _nimController,
    );
  }

  Widget _textboxTahun() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
      controller: _tahunController,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahun = int.tryParse(_tahunController.text) ?? 0; // handle invalid input
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TampilData(nama: nama, nim: nim, tahun: tahun),
        ));
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      ),
      child: const Text('Simpan'),
    );
  }
}
