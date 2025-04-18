import 'package:flutter/material.dart';
import 'homeee.dart'; // Importing our new UI design

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 27, 5, 171),
        ),
      ),
      home: const MyHomePage(title: 'Temperatuer converter'),
    );
  }
}
