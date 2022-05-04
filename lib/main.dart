import 'package:flutter/material.dart';
import 'package:get_cep/src/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(38, 63, 47, 1),
        ),
      ),
      title: 'Get CEP',
      home: const HomePage(),
    );
  }
}
