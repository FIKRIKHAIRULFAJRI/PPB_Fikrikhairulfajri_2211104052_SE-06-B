import 'package:flutter/material.dart';
import 'add_student_screen.dart';
import 'database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLite Biodata Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatefulWidget {
  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<Map<String, dynamic>> _students = [];

  @override
  void initState() {
    super.initState();
    _refreshStudentList();
  }

  void _refreshStudentList() async {
    final data = await DatabaseHelper.instance.getStudents();
    setState(() {
      _students = data;
    });
  }

  void _navigateToAddStudent() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddStudentScreen()),
    );
    _refreshStudentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Biodata Mahasiswa'),
      ),
      body: _students.isEmpty
          ? Center(child: Text('Belum ada data mahasiswa.'))
          : ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index) {
                final student = _students[index];
                return ListTile(
                  title: Text(student['name']),
                  subtitle: Text(
                      'NIM: ${student['nim']}\nAlamat: ${student['address']}\nHobi: ${student['hobby']}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddStudent,
        child: Icon(Icons.add),
      ),
    );
  }
}
