import 'package:flutter/material.dart';

import 'ProfilPage.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildButtonSubmit() {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (_namaLengkap == "" || _barang == "" || _jumlah == "") {
            SnackBar snackBar = SnackBar(
              content: Text("* data tidak boleh kosong"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfilePage(
                nama: _namaLengkap,
                username: widget.username,
                barang: _barang,
                jumlah: _jumlah,
                kode: _kode,
              );
            }));
          }
        },
        child: Text('Submit'),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: TextStyle(fontSize: 16)),
      ),
    );
  }

  String _namaLengkap = "";
  String _barang = "";
  String _jumlah = "";
  String _kode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Center(
          child: Column(
            children: [
              Text(
                "Data Penjualan\nHai ${widget.username}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 24),
              SizedBox(height: 12),
              _buildForm(),
              SizedBox(height: 24),
              _buildButtonSubmit()
            ],
          ),
        ),
      ),
    );
  }

  Widget _formInput(
      {required String hint,
      required String label,
      required Function(String value) setStateInput,
      int maxLines = 1}) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildForm() {
    return Column(children: [
      SizedBox(height: 12),
      _formInput(
        hint: "Masukkan Nama Lengkap",
        label: "Nama *",
        setStateInput: (value) {
          setState(() {
            _namaLengkap = value;
          });
        },
      ),
      SizedBox(height: 12),
      _formInput(
        hint: "Masukkan Nama Barang",
        label: "Nama Barang *",
        setStateInput: (value) {
          setState(() {
            _barang = value;
          });
        },
      ),
      SizedBox(height: 12),
      _formInput(
        hint: "Masukkan Total Pembelian",
        label: "TOTAL *",
        setStateInput: (value) {
          setState(() {
            _jumlah = value;
          });
        },
      ),
      SizedBox(height: 12),
      _formInput(
        hint: "Masukkan Kode Belanja",
        label: "Kode Belanja",
        setStateInput: (value) {
          setState(() {
            _kode = value;
          });
        },
      ),
    ]);
  }
}
