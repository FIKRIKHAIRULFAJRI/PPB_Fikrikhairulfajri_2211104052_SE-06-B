import 'package:flutter/material.dart';
import 'database_helper.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _nim = '';
  String _address = '';
  String _hobby = '';

  void _saveStudent() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await DatabaseHelper.instance.insertStudent({
        'name': _name,
        'nim': _nim,
        'address': _address,
        'hobby': _hobby,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                onSaved: (value) => _name = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'NIM'),
                onSaved: (value) => _nim = value!,
                validator: (value) =>
                    value!.isEmpty ? 'NIM tidak boleh kosong' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Alamat'),
                onSaved: (value) => _address = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hobi'),
                onSaved: (value) => _hobby = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Hobi tidak boleh kosong' : null,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveStudent,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
