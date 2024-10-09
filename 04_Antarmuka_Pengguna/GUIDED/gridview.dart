import 'package:flutter/material.dart';

class GridViewApp extends StatefulWidget {
  const GridViewApp({super.key});

  @override
  State<GridViewApp> createState() => _GridViewState();
}

class _GridViewState extends State<GridViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(Icons.add),
                Text('GridView 1'),
              ],
            ),
            color: const Color.fromARGB(255, 84, 155, 237),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text('GridView 2'),
                Icon(Icons.ac_unit),
              ],
            ),
            color: Colors.red,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView3'),
            color: Colors.green,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView4'),
            color: Colors.yellow,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView5'),
            color: Colors.red,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView5'),
            color: const Color.fromARGB(255, 219, 9, 173),
          ),
        ],
      ),
    );
  }
}
