import 'package:flutter/material.dart';
import 'package:sistema_entrega/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de entrega',
      home: const HomePage(),
      theme: ThemeData.dark(),
    );
  }
}
