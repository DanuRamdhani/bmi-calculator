import 'package:bmi_calculator/input.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 9, 119, 215),
          primary: const Color.fromARGB(255, 9, 119, 215),
        ),
        useMaterial3: true,
      ),
      home: const InputScreen(),
    );
  }
}
