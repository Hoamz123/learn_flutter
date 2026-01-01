import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'To do list',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: SafeArea(
          bottom: true,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ), //giong nhu padding horizoltal trong jetpack compose
            child: Column(
              children: [
                SizedBox(height: 20),
                itemContainer(color: Colors.blueGrey, task: fakeTask()),
                itemContainer(color: Colors.blue, task: fakeTask()),
                itemContainer(color: Colors.blueGrey, task: fakeTask()),
                itemContainer(color: Colors.blue, task: fakeTask()),
                itemContainer(color: Colors.blueGrey, task: fakeTask()),
                itemContainer(color: Colors.blue, task: fakeTask()),
                itemContainer(color: Colors.blueGrey, task: fakeTask()),
                itemContainer(color: Colors.blue, task: fakeTask()),
                itemContainer(color: Colors.blueGrey, task: fakeTask()),
                itemContainer(color: Colors.blue, task: fakeTask()),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
    );
  }

  Container itemContainer({required Color color, required String task}) {
    return Container(
      width: double.infinity, //fill maxWidth
      height: 80,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(9),
            blurRadius: 30,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(task, style: TextStyle(fontSize: 16, color: Colors.black)),
            Icon(Icons.delete, color: Colors.black87),
          ],
        ),
      ),
    );
  }

  Container boxMethod({
    required Color color,
    required Alignment alignment,
    required EdgeInsets padding,
    required String data,
    bool isCycle = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(isCycle ? 100 : 0),
      ),
      padding: padding,
      width: 150,
      height: 150,
      alignment: alignment,
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  //fake task
  // fake task
  String fakeTask() {
    List<String> data = [
      'Wake up early',
      'Go to the gym',
      'Study Flutter',
      'Finish homework',
      'Read a book',
      'Buy groceries',
      'Call mom',
      'Clean the room',
      'Write daily notes',
      'Sleep before 11 PM',
    ];

    data.shuffle();
    return data[0];
  }
}
