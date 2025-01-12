import 'package:flutter/material.dart';

import '../models/training.dart';


class TrainingDetailsScreen extends StatelessWidget {
  final Training training;

  const TrainingDetailsScreen({super.key, required this.training});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(training.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(training.imageUrl, height: 200),
            SizedBox(height: 10),
            Text(training.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Trainer: ${training.trainer}", style: TextStyle(fontSize: 18)),
            Text("Location: ${training.location}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(training.description),
          ],
        ),
      ),
    );
  }
}