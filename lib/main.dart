import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/prvider/audioProvider.dart';
import 'package:quran_app/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {return AudioProvider();},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const Home(),
      ),
    );
  }
}
