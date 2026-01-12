import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  final String task;
  final Color color;
  const CardBody({super.key, required this.task, required this.color});

  @override
  Widget build(BuildContext context) {
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
            Text(task, style: TextStyle(fontSize: 16, color: Colors.white)),
            Icon(Icons.delete, color: Colors.deepOrange),
          ],
        ),
      ),
    );
  }
}
