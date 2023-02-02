import './second_api.dart';
import './widgets/main_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './first_api.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:  {
        "secondapi" : (context) => const SecondApi(),
        "firstapi" : (context) => const FirstApi(),
      },
      theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
      ),
      debugShowCheckedModeBanner: false,
      home: const FirstApi(),
    );
  }
}
