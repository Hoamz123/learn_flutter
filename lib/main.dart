import 'package:abcd/model/items.dart';
import 'package:abcd/utils/Logger.dart';
import 'package:abcd/widget/addTaskBottomSheet.dart';
import 'package:flutter/material.dart';
import 'widget/card_body_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //StatelessWidget
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
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          bottom: true,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ), //giong nhu padding horizoltal trong jetpack compose
            child: Column(
              children: fakeTask()
                  .map(
                    (item) => CardBody(
                      task: item.content,
                      color: Colors.deepPurpleAccent,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                Logger.logRed(tag: "HOA", msg: "clicked");
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (BuildContext content) {
                    return AddTaskBottomSheet();
                  },
                );
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add, color: Colors.white, size: 30),
            );
          },
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
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  List<DataItem> fakeTask() {
    return [
      DataItem(id: '1', content: 'Wake up early'),
      DataItem(id: '2', content: 'Brush teeth'),
      DataItem(id: '3', content: 'Morning exercise'),
      DataItem(id: '4', content: 'Have breakfast'),
      DataItem(id: '5', content: 'Go to work'),
      DataItem(id: '6', content: 'Check emails'),
      DataItem(id: '7', content: 'Attend meeting'),
      DataItem(id: '8', content: 'Write code'),
      DataItem(id: '9', content: 'Review pull request'),
      DataItem(id: '10', content: 'Read a book'),
    ];
  }
}
